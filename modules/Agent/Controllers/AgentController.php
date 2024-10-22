<?php
namespace Modules\Agent\Controllers;

use Illuminate\Support\Facades\Log;
use Matrix\Exception;
use Modules\FrontendController;
use Illuminate\Support\Facades\Auth;
use Modules\Booking\Models\Booking;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Modules\Booking\Models\Enquiry;

use App\Helpers\ReCaptchaEngine;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\MessageBag;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules\Password;
use Modules\Agent\Events\NewAgentRegistered;
use Modules\Agent\Models\AgentRequest;

class AgentController extends FrontendController {

    use AuthenticatesUsers;

    protected $enquiryClass;
    private Booking $booking;

    public function __construct(Booking $booking, Enquiry $enquiry){
        $this->enquiryClass = $enquiry;
        parent::__construct();
        $this->booking = $booking;
    }


    public function upgradeAgent(Request $request){

        $user = Auth::user();
        $agentRequest = AgentRequest::query()->where("user_id",$user->id)->where("status","pending")->first();
        if(!empty($agentRequest)){
            return redirect()->back()->with('warning', __("You have just done the become agent request, please wait for the Admin's approved"));
        }
        // check agent auto approved
        $agentAutoApproved = setting_item('agent_auto_approved');
        $dataAgent['role_request'] = setting_item('agent_role');
        if ($agentAutoApproved) {
            if ($dataAgent['role_request']) {
                $user->assignRole($dataAgent['role_request']);
            }
            $dataAgent['status'] = 'approved';
            $dataAgent['approved_time'] = now();
        } else {
            $dataAgent['status'] = 'pending';
        }
        $agentRequestData = $user->agentRequest()->save(new AgentRequest($dataAgent));
        try {
            event(new NewAgentRegistered($user, $agentRequestData));
        } catch (Exception $exception) {
            Log::warning("NewAgentRegistered: " . $exception->getMessage());
        }
        return redirect()->back()->with('success', __('Request agent success!'));

    }
    // Agent
    public function register(Request $request){

        $rules = [
            'first_name' => [
                'required',
                'string',
                'max:255'
            ],
            'last_name'  => [
                'required',
                'string',
                'max:255'
            ],
            'business_name'  => [
                'required',
                'string',
                'max:255'
            ],
            'email'      => [
                'required',
                'string',
                'email',
                'max:255',
                'unique:users'
            ],
            'password'   => [
                'required',
                'string',
                Password::min(8)
                    ->mixedCase()
                    ->numbers()
                    ->symbols()
                    ->uncompromised(),
            ],
            'term' => ['required'],
        ];
        $messages = [
            'email.required'      => __('Email is required field'),
            'email.email'         => __('Email invalidate'),
            'password.required'   => __('Password is required field'),
            'first_name.required' => __('The first name is required field'),
            'last_name.required'  => __('The last name is required field'),
            'business_name.required'  => __('The business name is required field'),
            'term.required'       => __('The terms and conditions field is required'),
        ];
        if (ReCaptchaEngine::isEnable() and setting_item("user_enable_register_recaptcha")) {
            $messages['g-recaptcha-response.required'] = __('Please verify the captcha');
            $rules['g-recaptcha-response'] = ['required'];
        }
        $validator = Validator::make($request->all(), $rules, $messages);
        if ($validator->fails()) {
            return response()->json([
                'error'    => true,
                'messages' => $validator->errors()
            ], 200);
        } else {
            if (ReCaptchaEngine::isEnable() and setting_item("user_enable_register_recaptcha")) {
                $codeCapcha = $request->input('g-recaptcha-response');
                if (!ReCaptchaEngine::verify($codeCapcha)) {
                    $errors = new MessageBag(['message_error' => __('Please verify the captcha')]);
                    return response()->json([
                        'error'    => true,
                        'messages' => $errors
                    ], 200);
                }
            }
            $user = new \App\User();
            $user = $user->fill([
                'first_name'=>$request->input('first_name'),
                'last_name'=>$request->input('last_name'),
                'email'=>$request->input('email'),
                'password'=> Hash::make($request->input('password')),
                'business_name'=>$request->input('business_name'),
                'phone'=>$request->input('phone'),
            ]);
            $user->status = 'publish';
            $user->save();
            if (empty($user)) {
                return $this->sendError(__("Can not register"));
            }

            // check agent auto approved
            $agentAutoApproved = setting_item('agent_auto_approved');
            $dataAgent['role_request'] = setting_item('agent_role');

            if ($agentAutoApproved) {
                if ($dataAgent['role_request']) {
                    $user->assignRole($dataAgent['role_request']);
                }
                $dataAgent['status'] = 'approved';
                $dataAgent['approved_time'] = now();
            } else {
                $dataAgent['status'] = 'pending';
                $user->assignRole(setting_item('user_role'));
            }

            $agentRequestData = $user->agentRequest()->save(new AgentRequest($dataAgent));
            Auth::loginUsingId($user->id);
            try {
                event(new NewAgentRegistered($user, $agentRequestData));
            } catch (Exception $exception) {
                Log::warning("NewAgentRegistered: " . $exception->getMessage());
            }
            if ($agentAutoApproved) {
                return $this->sendSuccess([
                    'redirect' => url(app_get_locale(false, '/')),
                ]);
            } else {
                return $this->sendSuccess([
                    'redirect' => url(app_get_locale(false, '/')),
                ], __("Register success. Please wait for admin approval"));
            }
        }

    }
    public function dashboard(Request $request)
    {
        $this->checkPermission('dashboard_agent_access');
        $user_id = Auth::id();
        $data = [
            'cards_report'       => $this->booking->getTopCardsReportForVendor($user_id),
            'earning_chart_data' => $this->booking->getEarningChartDataForVendor(strtotime('monday this week'), time(), $user_id),
            'page_title'         => __("Agent Dashboard"),
            'breadcrumbs'        => [
                [
                    'name'  => __('Dashboard'),
                    'class' => 'active'
                ]
            ]
        ];
        return view('Agent::frontend.dashboard', $data);
    }

    public function getForSelect2(Request $request){

        $pre_selected = $request->query('pre_selected');
        $selected = $request->query('selected');
        if ($pre_selected && $selected) {
            if (is_array($selected)) {
                $res = User::whereIn('id', $selected)->take(50)->get();
                $items = [];
                if(!empty($res)){
                    foreach ($res as $item){
                        $items[] = [
                            'id'=>$item->id,
                            'text'=>$item->getDisplayName() ? $item->getDisplayName() . ' (#' . $item->id . ')' : $item->email . ' (#' . $item->id . ')'
                        ];
                    }
                }
            } else {
                $items = [];
                $item = User::find($selected);
                if(!empty($item)){
                    $items[] = [
                        'text' => $item->getDisplayName() ? $item->getDisplayName() . ' (#' . $item->id . ')' : $item->email . ' (#' . $item->id . ')'
                    ];
                }
            }

            return [
                'results'=>$items
            ];
        }

        $q = $request->query('q');
        $query = User::select('*');
        if ($q) {
            $query->where(function ($query) use ($q) {
                $query->where('first_name', 'like', '%' . $q . '%')->orWhere('last_name', 'like', '%' . $q . '%')->orWhere('email', 'like', '%' . $q . '%')->orWhere('id', $q)->orWhere('phone', 'like', '%' . $q . '%');
            });
        }
        $res = $query->orderBy('id', 'desc')->orderBy('first_name', 'asc')->limit(100)->get();
        $data = [];
        if (!empty($res)) {
            if($request->query("user_type") == "vendor"){
                //for only vendor
                foreach ($res as $item) {
                    if($item->hasPermission("dashboard_vendor_access")){
                        $data[] = [
                            'id'   => $item->id,
                            'text' => $item->getDisplayName() ? $item->getDisplayName() . ' (#' . $item->id . ')' : $item->email . ' (#' . $item->id . ')',
                        ];
                    }
                }
            }else{
                //for all
                foreach ($res as $item) {
                    $data[] = [
                        'id'   => $item->id,
                        'text' => $item->getDisplayName() ? $item->getDisplayName() . ' (#' . $item->id . ')' : $item->email . ' (#' . $item->id . ')',
                    ];
                }
            }
        }
        return response()->json([
            'results' => $data
        ]);
    }



}
