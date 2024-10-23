<?php

namespace Modules\Agent\Controllers;

use App\Helpers\ReCaptchaEngine;
use App\User;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Modules\Booking\Models\Booking;
use Modules\FrontendController;
use Modules\Template\Models\Template;
use Illuminate\Support\Facades\Validator;
use Modules\Booking\Models\Enquiry;
use Illuminate\Validation\Rule;


use Illuminate\Auth\Events\Registered;
use Mockery\Exception;
use Modules\Booking\Events\BookingCreatedEvent;
use Modules\Booking\Models\BookingPassenger;
use Modules\User\Events\SendMailUserRegistered;


class BookingController extends FrontendController
{


    use AuthorizesRequests;

    protected $booking;
    protected $enquiryClass;
    protected $bookingInst;

    public function __construct(Booking $booking, Enquiry $enquiryClass)
    {
        $this->booking = $booking;
        $this->enquiryClass = $enquiryClass;
    }
    public function index(Request $request)
    {

        $this->checkPermission('booking_manage_agent');

        $user_id = auth()->user()->id;


        $data = [
            'bookings' => $this->booking->getAgentBookingHistory($request->input('status'), $user_id),

            'statues'     => config('booking.statuses'),
            'breadcrumbs' => [
                [
                    'name'  => __('Booking History'),
                    'class' => 'active'
                ]
            ],
            'page_title'  => __("Booking History"),
        ];


        return view('Agent::frontend.booking.index', $data);
    }
    public function makeBooked(Request $request)
    {

        $template = Template::where('id', 1)->first();
        $type = 'agent_booking_search_form';
        $model = $request->input('model', [
            'title' => 'Hi There!',
            'sub_title' => 'Where would you like to go?',
            'service_types' => [
                "hotel",
                "space",
                "tour",
                "car",
                "event",
                "flight",
                "boat",
            ],
        ]);

        $search_option = $template->getPreview($type, $model);
        $data = [
            'search_option' => $search_option
        ];

        return view('Agent::frontend.booking.create', $data);
    }
    /**
     * @param Request $request
     * @return string json
     * @todo Handle Add To Cart Validate
     */
    public function addToCart(Request $request)
    {

        if (!is_enable_guest_checkout() and !Auth::check()) {
            return $this->sendError(__("You have to login in to do this"))->setStatusCode(401);
        }

        if (auth()->user() && !auth()->user()->hasVerifiedEmail() && setting_item('enable_verify_email_register_user') == 1) {
            return $this->sendError(__("You have to verify email first"), ['url' => url('/email/verify')]);
        }
        $validator = Validator::make($request->all(), [
            'service_id'   => 'required|integer',
            'service_type' => 'required'
        ]);
        if ($validator->fails()) {
            return $this->sendError('', ['errors' => $validator->errors()]);
        }
        $service_type = $request->input('service_type');
        $service_id = $request->input('service_id');
        $allServices = get_bookable_services();
        if (empty($allServices[$service_type])) {
            return $this->sendError(__('Service type not found'));
        }

        $module = $allServices[$service_type];
        $service = $module::find($service_id);
        if (empty($service) or !is_subclass_of($service, '\\Modules\\Booking\\Models\\Bookable')) {
            return $this->sendError(__('Service not found'));
        }
        if (!$service->isBookable()) {
            return $this->sendError(__('Service is not bookable'));
        }

        if (\auth()->user() && Auth::id() == $service->author_id) {
            return $this->sendError(__('You cannot book your own service'));
        }

        $request['agent_booking'] = true;

        return $service->addToCart($request);
    }
    protected function validateCheckout($code)
    {

        if (!is_enable_guest_checkout() and !Auth::check()) {
            $error = __("You have to login in to do this");
            if (\request()->isJson()) {
                return $this->sendError($error)->setStatusCode(401);
            }
            return redirect(route('login', ['redirect' => \request()->fullUrl()]))->with('error', $error);
        }

        $booking = $this->booking::where('code', $code)->first();

        $this->bookingInst = $booking;

        if (empty($booking)) {
            abort(404);
        }
        if (!is_enable_guest_checkout() and $booking->agent_id != Auth::id()) {
            abort(404);
        }
        return true;
    }

    public function checkout($code)
    {

        $res = $this->validateCheckout($code);

        if ($res !== true) return $res;

        $booking = $this->bookingInst;

        if (!in_array($booking->status, ['draft', 'unpaid'])) {
            return redirect('/');
        }

        $is_api = request()->segment(1) == 'api';
        $users = User::where('role_id', setting_item('user_role'))->where('deleted_at', null)->get();

        $data = [
            'page_title'    => __('Checkout'),
            'booking'       => $booking,
            'service'       => $booking->service,
            'gateways'      => get_available_gateways(),
            'user'          => auth()->user(),
            'users'         => $users,
            'is_api'        => $is_api
        ];

        return view('Agent::frontend.booking.checkout', $data);
    }

    public function checkStatusCheckout($code)
    {
        $booking = $this->booking::where('code', $code)->first();
        $data = [
            'error'    => false,
            'message'  => '',
            'redirect' => ''
        ];
        if (empty($booking)) {
            $data = [
                'error'    => true,
                'redirect' => url('/')
            ];
        }
        if (!is_enable_guest_checkout() and $booking->agent_id != Auth::id()) {
            $data = [
                'error'    => true,
                'redirect' => url('/')
            ];
        }
        if (!in_array($booking->status, ['draft', 'unpaid'])) {
            $data = [
                'error'    => true,
                'redirect' => url('/')
            ];
        }
        return response()->json($data, 200);
    }
    // doCheckout
    protected function validateDoCheckout()
    {
        $request = \request();
        if (!is_enable_guest_checkout() and !Auth::check()) {
            return $this->sendError(__("You have to login in to do this"))->setStatusCode(401);
        }

        if (auth()->user() && !auth()->user()->hasVerifiedEmail() && setting_item('enable_verify_email_register_user') == 1) {
            return $this->sendError(__("You have to verify email first"), ['url' => url('/email/verify')]);
        }
        /**
         * @param Booking $booking
         */
        $validator = Validator::make($request->all(), [
            'code' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->sendError('', ['errors' => $validator->errors()]);
        }
        $code = $request->input('code');

        $booking = $this->booking::where('code', $code)->first();
        $this->bookingInst = $booking;

        if (empty($booking)) {
            abort(404);
        }
        if (!is_enable_guest_checkout() and $booking->agent_id != Auth::id()) {
            abort(404);
        }
        return true;
    }

    public function doCheckout(Request $request)
    {

        /**
         * @var $booking Booking
         * @var $user User
         */
        $res = $this->validateDoCheckout();
        if ($res !== true) return $res;

        $user = auth()->user();

        $booking = $this->bookingInst;

        if (!in_array($booking->status, ['draft', 'unpaid'])) {
            return $this->sendError('', [
                'url' => $booking->getDetailUrl()
            ]);
        }
        $service = $booking->service;
        if (empty($service)) {
            return $this->sendError(__("Service not found"));
        }

        $is_api = request()->segment(1) == 'api';

        /**
         * Google ReCapcha
         */
        if (!$is_api and ReCaptchaEngine::isEnable() and setting_item("booking_enable_recaptcha")) {
            $codeCapcha = $request->input('g-recaptcha-response');
            if (!$codeCapcha or !ReCaptchaEngine::verify($codeCapcha)) {
                return $this->sendError(__("Please verify the captcha"));
            }
        }

        $messages = [];
        $rules = [
            'term_conditions' => 'required',
        ];

        $confirmRegister = $request->input('confirmRegister');
        if (!empty($confirmRegister)) {
            $rules = [
                'first_name'      => 'required|string|max:255',
                'last_name'       => 'string|max:255',
                'email'           => 'string|email|max:255',
                'phone'           => 'required|string|max:255',
                'country'         => 'required'
            ];
            $rules['password'] = 'required|string|confirmed|min:6|max:255';
            $rules['email'] = ['email', 'max:255', Rule::unique('users')];
            $messages['password.confirmed'] = __('The password confirmation does not match');
            $messages['password.min'] = __('The password must be at least 6 characters');
        } else {
            $rules['customer_id'] = 'required';
            $messages['customer_id.required'] = __('Please Select Customer');
        }

        $how_to_pay = $request->input('how_to_pay', '');
        $credit = $request->input('credit', 0);
        $payment_gateway = $request->input('payment_gateway');

        // require payment gateway except pay full
        if (empty(floatval($booking->deposit)) || $how_to_pay == 'deposit' || !auth()->check()) {
            $rules['payment_gateway'] = 'required';
        }

        if (auth()->check()) {
            if ($credit > $user->balance) {
                return $this->sendError(__("Your credit balance is :amount", ['amount' => $user->balance]));
            }
        } else {
            // force credit to 0 if not login
            $credit = 0;
        }

        $rules = $service->filterCheckoutValidate($request, $rules);
        if (!empty($rules)) {
            $messages['term_conditions.required'] = __('Term conditions is required field');
            $messages['payment_gateway.required'] = __('Payment gateway is required field');

            $validator = Validator::make($request->all(), $rules, $messages);
            if ($validator->fails()) {
                return $this->sendError('', ['errors' => $validator->errors()]);
            }
        }

        $wallet_total_used = credit_to_money($credit);
        if ($wallet_total_used > $booking->total) {
            $credit = money_to_credit($booking->total, true);
            $wallet_total_used = $booking->total;
        }

        if ($res = $service->beforeCheckout($request, $booking)) {
            return $res;
        }

        if ($how_to_pay == 'full' and !empty($booking->deposit)) {
            $booking->addMeta('old_deposit', $booking->deposit ?? 0);
        }
        $oldDeposit = $booking->getMeta('old_deposit', 0);
        if (empty(floatval($booking->deposit)) and !empty(floatval($oldDeposit))) {
            $booking->deposit = $oldDeposit;
        }



        if (!empty($confirmRegister)) {
            // Normal Checkout
            $booking->first_name = $request->input('first_name');
            $booking->last_name = $request->input('last_name');
            $booking->email = $request->input('email');
            $booking->phone = $request->input('phone');
            $booking->address = $request->input('address_line_1');
            $booking->address2 = $request->input('address_line_2');
            $booking->city = $request->input('city');
            $booking->state = $request->input('state');
            $booking->zip_code = $request->input('zip_code');
            $booking->country = $request->input('country');

            $customer = new User();
            $customer->first_name = $request->input('first_name');
            $customer->last_name = $request->input('last_name');
            $customer->email = $request->input('email');
            $customer->phone = $request->input('phone');
            $customer->address = $request->input('address_line_1');
            $customer->address2 = $request->input('address_line_2');
            $customer->city = $request->input('city');
            $customer->state = $request->input('state');
            $customer->zip_code = $request->input('zip_code');
            $customer->country = $request->input('country');
            $customer->password = bcrypt($request->input('password'));
            $customer->status = 'publish';
            $customer->save();

            event(new Registered($customer));

            try {
                event(new SendMailUserRegistered($customer));
            } catch (\Matrix\Exception $exception) {
                Log::warning("SendMailUserRegistered: " . $exception->getMessage());
            }
            $customer->assignRole(setting_item('user_role'));
        } else {

            $customer_id = $request->input('customer_id');

            $customer = User::where('id', $customer_id)->first();

            $booking->first_name = $customer->first_name;
            $booking->last_name = $customer->last_name;
            $booking->email = $customer->email;
            $booking->phone = $customer->phone;
            $booking->city = $customer->city;
            $booking->state = $customer->state;
            $booking->zip_code = $customer->zip_code;
            $booking->country = $customer->country;

            $booking->address = $customer->address;
            $booking->address2 = $customer->address2;
        }




        $booking->customer_notes = $request->input('customer_notes');
        $booking->gateway = $payment_gateway;
        $booking->wallet_credit_used = floatval($credit);
        $booking->wallet_total_used = floatval($wallet_total_used);
        $booking->pay_now = floatval((int)$booking->deposit == null ? $booking->total : (int)$booking->deposit);

        // If using credit
        if ($booking->wallet_total_used > 0) {
            if ($how_to_pay == 'full') {
                $booking->deposit = 0;
                $booking->pay_now = $booking->total;
            } elseif ($how_to_pay == 'deposit') {
                // case guest input credit more than "pay deposit" need to pay
                // Ex : pay deposit 10$ but guest input 20$ -> minus credit balance = 10$
                if ($wallet_total_used > $booking->deposit) {
                    $wallet_total_used = $booking->deposit;
                    $booking->wallet_total_used = floatval($wallet_total_used);
                    $booking->wallet_credit_used = money_to_credit($wallet_total_used, true);
                }
            }

            $booking->pay_now = max(0, $booking->pay_now - $wallet_total_used);
            $booking->paid = $booking->wallet_total_used;
        } else {
            if ($how_to_pay == 'full') {
                $booking->deposit = 0;
                $booking->pay_now = $booking->total;
            }
        }
        $gateways = get_payment_gateways();
        if ($booking->pay_now > 0) {
            $gatewayObj = new $gateways[$payment_gateway]($payment_gateway);
            if (!empty($rules['payment_gateway'])) {
                if (empty($gateways[$payment_gateway]) or !class_exists($gateways[$payment_gateway])) {
                    return $this->sendError(__("Payment gateway not found"));
                }
                if (!$gatewayObj->isAvailable()) {
                    return $this->sendError(__("Payment gateway is not available"));
                }
            }
        }
        if ($booking->wallet_credit_used && auth()->check()) {
            try {
                $transaction = $user->withdraw($booking->wallet_credit_used, [
                    'wallet_total_used' => $booking->wallet_total_used
                ], $booking->id);
            } catch (\Exception $exception) {
                return $this->sendError($exception->getMessage());
            }
            $booking->wallet_transaction_id = $transaction->id;
        }


        $booking->customer_id = $customer->id;
        $booking->save();


        $booking->addMeta('locale', app()->getLocale());
        $booking->addMeta('how_to_pay', $how_to_pay);

        // Save Passenger
        $this->savePassengers($booking, $request);



        if ($res = $service->afterCheckout($request, $booking)) {
            return $res;
        }


        if ($booking->pay_now > 0) {
            try {
                $gatewayObj->process($request, $booking, $service);
            } catch (Exception $exception) {
                return $this->sendError($exception->getMessage());
            }
        } else {
            if ($booking->paid < $booking->total) {
                $booking->status = $booking::PARTIAL_PAYMENT;
            } else {
                $booking->status = $booking::PAID;
            }

            if (!empty($booking->coupon_amount) and $booking->coupon_amount > 0 and $booking->total == 0) {
                $booking->status = $booking::PAID;
            }

            $booking->save();
            event(new BookingCreatedEvent($booking));
            return $this->sendSuccess([
                'url' => $booking->getDetailUrl()
            ], __("You payment has been processed successfully"));
        }
    }


    protected function savePassengers(Booking $booking, Request $request)
    {
        if ($totalPassenger = $booking->calTotalPassenger()) {
            $booking->passengers()->delete();
            $input = $request->input('passengers', []);
            for ($i = 1; $i <= $totalPassenger; $i++) {
                $passenger = new BookingPassenger();
                $data = [
                    'booking_id' => $booking->id,
                    'first_name' => $input[$i]['first_name'] ?? '',
                    'last_name'  => $input[$i]['last_name'] ?? '',
                    'email'      => $input[$i]['email'] ?? '',
                    'phone'      => $input[$i]['phone'] ?? '',
                ];
                $passenger->fillByAttr(array_keys($data), $data);
                $passenger->save();
            }
        }
    }

    public function detail(Request $request, $code)
    {
        if (!is_enable_guest_checkout() and !Auth::check()) {
            return $this->sendError(__("You have to login in to do this"))->setStatusCode(401);
        }

        $booking = $this->booking::where('code', $code)->first();
        // dd($booking, $request->all());
        if (empty($booking)) {
            abort(404);
        }

        if ($request->transId) {
            $payment = $booking->payment;
            if ($payment) {
                $payment->status = 'completed';
                $payment->save();
            }
            try {
                $booking->paid += (float) $booking->pay_now;
                $booking->markAsPaid(Booking::CONFIRMED);

            } catch (\Swift_TransportException $e) {
                Log::warning($e->getMessage());
            }
        }

        if ($booking->status == 'draft') {
            return redirect($booking->getAgentCheckoutUrl());
        }
        if (!is_enable_guest_checkout() and $booking->agent_id != Auth::id()) {
            abort(404);
        }
        $data = [
            'page_title' => __('Booking Details'),
            'booking'    => $booking,
            'service'    => $booking->service,
        ];
        if ($booking->gateway) {
            $data['gateway'] = get_payment_gateway_obj($booking->gateway);
        }

        return view('Agent::frontend/booking/detail', $data);
    }
    public function bookingInvoice($code)
    {
        $booking = Booking::where('code', $code)->first();

        $user_id = Auth::id();

        $user = User::where('id', $user_id)->first();
        // Agent Info
        $logo_data = $user->getVerifyData("logo");
        $agent_logo = json_decode($logo_data);
        $logo = $agent_logo->download;
        $company_name = $user->getVerifyData("company_name");
        $company_address = $user->getVerifyData("company_address");
        // Log::channel('result')->info($company_address);


        if (empty($booking)) {
            return redirect('agent/booking');
        }
        // if ($booking->customer_id != $user_id and $booking->vendor_id != $user_id) {
        //     return redirect('agent/booking');
        // }
        $data = [
            'booking'    => $booking,
            'logo' => $logo,
            'company_name' => $company_name,
            'company_address' => $company_address,
            'service'    => $booking->service,
            'page_title' => __("Invoice")
        ];
        return view('Agent::frontend.bookingInvoice', $data);
    }
    public function ticket($code = '')
    {
        $booking = Booking::where('code', $code)->first();
        $user_id = Auth::id();
        if (empty($booking)) {
            return redirect('agent/booking');
        }
        if ($booking->customer_id != $user_id and $booking->vendor_id != $user_id) {
            return redirect('agent/booking');
        }
        $data = [
            'booking'    => $booking,
            'service'    => $booking->service,
            'page_title' => __("Ticket")
        ];
        return view('User::frontend.booking.ticket', $data);
    }
}
