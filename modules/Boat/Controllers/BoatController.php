<?php

namespace Modules\Boat\Controllers;

use App\Http\Controllers\Controller;
use App\Models\User;
use Carbon\Carbon;
use Modules\Boat\Models\Boat;
use Illuminate\Http\Request;
use Modules\Location\Models\Location;
use Modules\Review\Models\Review;
use Modules\Core\Models\Attributes;
use Illuminate\Support\Facades\DB;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Modules\Boat\Models\BoatBooking;
use Modules\Boat\Models\BoatCabin;
use Modules\Boat\Models\BoatDestination;
use Illuminate\Support\Str;
use Modules\Boat\Models\BoatBookingCabin;
use Modules\Boat\Models\BoatSchedule;
use Modules\Sms\Core\Facade\Sms;
use Mpdf\Mpdf;
use Propaganistas\LaravelPhone\PhoneNumber;

class BoatController extends Controller
{
    protected $boatClass;
    protected $locationClass;
    public function __construct(Boat $boatClass, Location $locationClass)
    {
        $this->boatClass = $boatClass;
        $this->locationClass = $locationClass;
    }


    public function index(Request $request)
    {
        $layout = setting_item("boat_layout_search", 'normal');
        if ($request->query('_layout')) {
            $layout = $request->query('_layout');
        }
        $is_ajax = $request->query('_ajax');
        $for_map = $request->query('_map', $layout === 'map');

        if (!empty($request->query('limit'))) {
            $limit = $request->query('limit');
        } else {
            $limit = !empty(setting_item("boat_page_limit_item")) ? setting_item("boat_page_limit_item") : 9;
        }

        $query = $this->boatClass->search($request->input());
        $list = $query->paginate($limit);

        $markers = [];
        if (!empty($list) and $for_map) {
            foreach ($list as $row) {
                $markers[] = [
                    "id"      => $row->id,
                    "title"   => $row->title,
                    "lat"     => (float)$row->map_lat,
                    "lng"     => (float)$row->map_lng,
                    "gallery" => $row->getGallery(true),
                    "infobox" => view('Boat::frontend.layouts.search.loop-grid', ['row' => $row, 'disable_lazyload' => 1, 'wrap_class' => 'infobox-item'])->render(),
                    'marker' => get_file_url(setting_item("boat_icon_marker_map"), 'full') ?? url('images/icons/png/pin.png'),
                ];
            }
        }
        $limit_location = 15;
        if (empty(setting_item("boat_location_search_style")) or setting_item("boat_location_search_style") == "normal") {
            $limit_location = 1000;
        }
        $data = [
            'rows' => $list,
            'layout' => $layout
        ];
        if ($is_ajax) {
            return $this->sendSuccess([
                "markers" => $markers,
                'fragments' => [
                    '.ajax-search-result' => view('Boat::frontend.ajax.search-result' . ($for_map ? '-map' : ''), $data)->render(),
                    '.result-count' => $list->total() ? ($list->total() > 1 ? __(":count boats found", ['count' => $list->total()]) : __(":count boat found", ['count' => $list->total()])) : '',
                    '.count-string' => $list->total() ? __("Showing :from - :to of :total Boats", ["from" => $list->firstItem(), "to" => $list->lastItem(), "total" => $list->total()]) : ''
                ],
            ]);
        }
        $data = [
            'rows'               => $list,
            'list_location'      => $this->locationClass::where('status', 'publish')->limit($limit_location)->with(['translation'])->get()->toTree(),
            'boat_min_max_price' => $this->boatClass::getMinMaxPrice(),
            'markers'            => $markers,
            "blank" => setting_item('search_open_tab') == "current_tab" ? 0 : 1,
            "seo_meta"           => $this->boatClass::getSeoMetaForPageList()
        ];
        $data['attributes'] = Attributes::where('service', 'boat')->orderBy("position", "desc")->with(['terms' => function ($query) {
            $query->withCount('boat');
        }, 'translation'])->get();

        if ($layout == "map") {
            $data['body_class'] = 'has-search-map';
            $data['html_class'] = 'full-page';
            return view('Boat::frontend.search-map', $data);
        }
        $data['layout'] = $layout;

        return view('Boat::frontend.search', $data);
    }

    public function detail(Request $request, $slug)
    {
        $row = $this->boatClass::where('slug', $slug)->with(['location', 'translation', 'hasWishList'])->first();
        if (empty($row) or !$row->hasPermissionDetailView()) {
            return redirect('/');
        }
        $translation = $row->translate();
        $boat_related = [];
        $location_id = $row->location_id;
        if (!empty($location_id)) {
            $boat_related = $this->boatClass::where('location_id', $location_id)->where("status", "publish")->take(4)->whereNotIn('id', [$row->id])->with(['location', 'translation', 'hasWishList'])->get();
        }
        $review_list = $row->getReviewList();
        $data = [
            'row'          => $row,
            'translation'       => $translation,
            'boat_related' => $boat_related,
            'booking_data' => $row->getBookingData(),
            'review_list'  => $review_list,
            'seo_meta'  => $row->getSeoMetaWithTranslation(app()->getLocale(), $translation),
            'body_class' => 'is_single',
            'breadcrumbs'       => [
                [
                    'name'  => __('Boat'),
                    'url'  => route('boat.search'),
                ],
            ],
        ];
        $data['breadcrumbs'] = array_merge($data['breadcrumbs'], $row->locationBreadcrumbs());
        $data['breadcrumbs'][] = [
            'name'  => $translation->title,
            'class' => 'active'
        ];
        $this->setActiveMenu($row);
        return view('Boat::frontend.detail', $data);
    }


    public function newindex()
    {
        $boats = Boat::latest()->get();
        $boatDestinations = BoatDestination::latest()->get();
        return view('Boat::Frontend.index', ['boats' => $boats, 'boatDestinations' =>  $boatDestinations]);
    }

    public function searchBoat(Request $request)
    {
        $destinationId = $request->input('destination_id');
        $startDate = $request->input('start_date');
        $endDate = $request->input('end_date');

        $query = Boat::query();
        if ($destinationId) {
            $query->orWhere('destination_id', $destinationId);
        }

        if ($startDate && $endDate) {
            $query->whereHas('boatSchedule', function ($query) use ($startDate, $endDate) {
                $query->whereBetween('check_in_date', [$startDate, $endDate]);
            });
        }

        $results = $query->get();
        $resultBoatIds = $results->pluck('id');
        $destinations = BoatDestination::latest()->get();
        $relatedBoats = Boat::where('destination_id', $destinationId)
            ->whereNotIn('id', $resultBoatIds)
            ->latest()
            ->get();

        // dd($request->all(),$results);
        return view('Boat::Frontend.search_page', [
            'boats' => $results,
            'boatDestinations' => $destinations,
            'relatedBoats' => $relatedBoats,
            'checkingDate' => $startDate,
            'checkoutDate' => $endDate,
            'destinationId' => $destinationId
        ]);
    }





    public function destinationDetails($slug)
    {
        $boatDestination = BoatDestination::where("slug", $slug)->with('boat')->first();
        return view('Boat::Frontend.destinationDetails', ['boatDestination' => $boatDestination]);
    }




    public function boatDetails(Request $request, $slug)
    {
        // dd($request->all());
        $checkingDate = $request->input('checking_date', null);
        $checkoutDate = $request->input('checkout_date', null);
        $boat = Boat::where('slug', $slug)->first();
        if (!$boat) {
            return abort(404, 'Boat not found');
        }
        $cabinIds = $boat->boatCabin()->pluck('id');

        $checkInDate = [];


        foreach ($boat->boatSchedule ?? [] as $schedule) {
            if (isset($schedule->check_in_date)) {
                $checkInDate[] = $schedule->check_in_date;
            }
        }


        $bookedCabin = BoatBookingCabin::whereIn('cabin_id', $cabinIds)
            ->whereHas('boatBooking', function ($query) use ($checkInDate) {
                $query->whereIn('booked_date', $checkInDate);
            })
            ->pluck('cabin_id');


        return view('Boat::Frontend.boatDetails', [
            'boat' => $boat,
            'bookedCabinIds' => $bookedCabin,
            'checkingDate' => $checkingDate,
            'checkoutDate' => $checkoutDate,
        ]);
    }



    public function fullBoatDetails(Request $request, $slug)
    {
        // dd($request->all());
        $checkingDate = $request->input('checking_date');
        $checkOutDate = $request->input('checkout_date');
        $boat = Boat::where('slug', $slug)->first();
        return view("Boat::Frontend.fullboatDetails", ['boat' => $boat, 'checkingDate' => $checkingDate, 'checkoutDate' => $checkOutDate]);
    }



    public function scheduleCheckInDateByCheckInDate(Request $request)
    {
        // dd($request->all());
        $checkInDate = $request->input('checkInDate');
        $availableCheckInDate = BoatSchedule::where('boat_id', $request->input("boat_id"))
            ->where('check_in_date', $checkInDate)->first();
        if ($availableCheckInDate) {
            $boatCabinIds = $availableCheckInDate->boat->boatCabin->pluck('id');

            $bookedCabin = BoatBookingCabin::whereIn('cabin_id', $boatCabinIds)
                ->whereHas('boatBooking', function ($query) use ($checkInDate) {
                    $query->where('booked_date', $checkInDate);
                })
                ->pluck('cabin_id');
            // dd($availableCheckInDate,$boatCabinIds, $bookedCabin);
            return response()->json(
                [
                    'message' => "success",
                    'bookedCabinIds' => $bookedCabin,
                    'schedule' => true
                ]
            );
            // $isBooked = in_array((string) $cabin->id, $bookedCabinIdsArray);
        } else {
            return response()->json(
                [
                    'message' => "failed",
                    'schedule' => false
                ]
            );
        }
    }




    public function search()
    {
        $boats = Boat::latest()->with('boatFeature', 'boatSchedule')->get();
        return view('Boat::Frontend.search_page', ['boats' => $boats]);
    }


    public function getBoatCabinByBoatId($id)
    {
        $boatId = $id;
        $boat = Boat::with('boatSchedule')->find($boatId);
        $nextGhatLeavingDate = $boat->boatSchedule->next_ghat_leaving_date ?? null;
        $boatCabins = $boat->boatCabin()->get();
        $cabinIds =  $boat->boatCabin()->pluck('id');
        $bookedCabin = BoatBookingCabin::whereIn('cabin_id', $cabinIds)
            ->whereHas('boatBooking', function ($query) use ($nextGhatLeavingDate) {
                $query->where('booked_date', $nextGhatLeavingDate);
            })
            ->pluck('cabin_id');
        return response()->json([
            'boatCabins' => $boatCabins,
            'bookedCabinId' => $bookedCabin
        ]);
    }


    public function getCabinInfoByCabinId($id)
    {
        $cabin = BoatCabin::find($id);
        return response()->json($cabin);
    }


    public function boatCabinBooking(Request $request)
    {
        DB::beginTransaction();
        try {
            $boatId = $request->input('boat_id');
            $cabinIds = $request->input('cabinid');
            $subtotal = $request->input('subtotal');
            $discount = $request->input('discount');
            $totalAmount = $request->input("totalAmount");
            $boat = Boat::find($boatId);

            $bookedDate = $request->input('check_in_date');
            $bookedTime = $boat->check_in_time;
            $percentageOfBookingAmount = $boat->booking_percentage ?? 0;
            $bookingAmount = (float)$totalAmount * (float)$percentageOfBookingAmount / 100;
            $afterBookingAmount = (float)$totalAmount - (float)$bookingAmount;


            $boatBooking = BoatBooking::create([
                'booking_id' => (string) Str::uuid(),
                'boat_id' => $boatId,
                'destination_id' => $boat->destination_id,
                'user_id' => auth()->user()->id ?? null,
                'cabin_ids' => json_encode($cabinIds),
                'booking_date' => Carbon::now(),
                'subtotal' => $subtotal,
                'discount_amount' => $discount,
                'total_amount' => $totalAmount,
                'booking_status' => "pending",
                'payment_status' => "not paid",
                'booked_date' => $bookedDate,
                'booked_time' => $bookedTime,
                'booking_type' => 'cabin',
                'user_type' => auth()->check() ? 'authenticate' : 'guest',
                'booking_amount' => $bookingAmount ?? '',
                'after_booking_amount' => $afterBookingAmount ?? ''

            ]);

            foreach ($cabinIds ?? [] as $key => $cabinid) {
                $cabin = BoatCabin::find($cabinid);
                $boatBooking->boatBookingCabin()->create([
                    'boat_id' => $boatId,
                    'cabin_id' => $cabinid,
                    'user_id' => auth()->user()->id ?? null,
                    'user_type' => auth()->check() ? 'authenticate' : 'guest',
                    'cabin_price' => $cabin->price,
                    'booking_date' => Carbon::now()->startOfDay()->format('Y-m-d'),
                    'extra_person' => $request->input('extra_person')[$cabinid] ?? '',
                    'total_amount' => $request->input('cabin_total')[$cabinid] ?? '',
                ]);
            }
            DB::commit();
            $encryptedId = Crypt::encryptString($boatBooking->id);
            return redirect()->route('boat.front.boatCabinBookingCheckout', ['id' => $encryptedId]);
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->back()->with('error', 'Booking failed: ' . $e->getMessage());
        }
    }


    public function boatCabinBookingCheckout($id)
    {
        $decryptedId = Crypt::decryptString($id);
        $boatBooking = BoatBooking::with('boatBookingCabin', 'boat')->find($decryptedId);
        return view('Boat::Frontend.checkout', ['boatbooking' => $boatBooking]);
    }

    public function boatCabinBookingConfirmCheckout(Request $request, $id)
    {
        // dd($request->all());
        $boatBooking = BoatBooking::with('boatBookingCabin', 'boat')->find($id);
        $payment_method = $request->input("payment_method");
        if ($payment_method == "physical") {
            $this->handlePhysicalPayment($request->all(), $boatBooking);
            $encryptedId = Crypt::encryptString($id);
            return redirect()->route('boat.front.boatCabinBookingSuccess', ['id' => $encryptedId]);
        } elseif ($payment_method == 'ekpay') {
            $encryptedId = Crypt::encryptString($id);
            $payment =  $this->handleEkpayments($request->all(), $boatBooking, $encryptedId);
            return $payment;
        } else {
            $encryptedId = Crypt::encryptString($id);
            $payment =  $this->handleOtherPayments($request->all(), $boatBooking, $encryptedId);
            return $payment;
        }
    }



    // physical payment
    protected function handlePhysicalPayment($requestData, $boatBooking)
    {
        $userInfo = [
            'customer_name' => $requestData['cus_name'],
            'customer_phone' => $requestData['cus_phone'],
            'customer_email' => $requestData['cus_email'],
            'customer_address' => $requestData['cus_address']
        ];
        $boatBooking->update([
            "booking_status" => "confirm",
            "payment_status" => "unpaid",
            "payment_method" => "physical",
            "user_info" => json_encode($userInfo)
        ]);
    }


    protected function handleOtherPayments($requestData, $boatBooking, $id)
    {
        // dd($id);
        $userInfo = [
            'customer_name' => $requestData['cus_name'],
            'customer_phone' => $requestData['cus_phone'],
            'customer_email' => $requestData['cus_email'],
            'customer_address' => $requestData['cus_address']
        ];
        $tarnsactionId = uniqid();
        $successUrl = '';
        $cancelUrl = '';
        $failedUrl = '';
        $client = new Client();

        $post_data = [
            'store_id' => config('services.sslcommerz.store_id', 'test65509f41a1392'),
            'store_passwd' => config('services.sslcommerz.store_password'),
            'total_amount' => $boatBooking->booking_amount ?? $boatBooking->total_amount,
            'currency' => "BDT",
            'tran_id' => $tarnsactionId,
            'success_url' => route('boat.front.boatCabinBookingSuccessByPayment'),
            'fail_url' => url('/fail'),
            'cancel_url' => url('/cancel'),
            'cus_name' => $requestData['cus_name'],
            'cus_email' => $requestData['cus_email'],
            'cus_add1' => $requestData['cus_address'],
            'cus_phone' => $requestData['cus_phone'],
            'cus_city' => 'dhaka',
            'cus_country' => 'Bangladesh',
            'shipping_method' => 'no',
            'product_name' => 'Demo Product',
            'product_category' => 'Demo',
            'product_profile' => 'general',
        ];
        // dd("ami other payment");
        $sslcommerz_url = env('SSLCOMMERZ_SANDBOX') == 'true'
            ? 'https://sandbox.sslcommerz.com/gwprocess/v4/api.php'
            : 'https://securepay.sslcommerz.com/gwprocess/v4/api.php';

        $response = $client->post($sslcommerz_url, [
            'form_params' => $post_data
        ]);

        $response_data = json_decode($response->getBody(), true);
        if (isset($response_data['GatewayPageURL']) && $response_data['GatewayPageURL'] != '') {
            $boatBooking->update([
                'transaction_id' => $tarnsactionId,
                'user_info' => json_encode($userInfo)
            ]);
            return redirect($response_data['GatewayPageURL']);
        } else {
            return "Payment session creation failed.";
        }


        return "Payment API request failed.";
    }

    protected function handleEkpayments($requestData, $boatBooking, $id)
    {

        $tarnsactionId = uniqid();
        $userInfo = [
            'customer_name' => $requestData['cus_name'],
            'customer_phone' => $requestData['cus_phone'],
            'customer_email' => $requestData['cus_email'],
            'customer_address' => $requestData['cus_address']
        ];
        $client = new Client();
        $post_data = [
            'mer_info' => [
                'mer_reg_id' => 'resortbazar_test',
                'mer_pas_key' => 'tM1@TT7h',
            ],
            'req_timestamp' => now()->format('Y-m-d H:i:s') . ' GMT+6',
            'feed_uri' => [
                'c_uri' => "http://example.com/test/cancel",
                'f_uri' => "http://example.com/test/fail",
                's_uri' => route('boat.front.boatBookingSuccessByPayment', $tarnsactionId),
            ],
            'cust_info' => [
                'cust_email' => $requestData['cus_email'],
                'cust_id' => 'sample_id',
                'cust_mail_addr' => $requestData['cus_address'],
                'cust_mobo_no' => $requestData['cus_phone'],
                'cust_name' => $requestData['cus_name'],
            ],
            'trns_info' => [
                'ord_det' => 'order-details',
                'ord_id' => $boatBooking->booking_id,
                'trnx_amt' =>  $boatBooking->booking_amount ?? $boatBooking->total_amount,
                'trnx_currency' => 'BDT',
                'trnx_id' => $tarnsactionId,
            ],
            'ipn_info' => [
                'ipn_channel' => '1',
                'ipn_email' => 'customer@example.com',
                'ipn_uri' => "http://example.com/test/ipn",
            ],
            'mac_addr' => "1.1.1.1",
        ];
        // dd(json_encode($post_data));
        $ekpay_url = 'https://sandbox.ekpay.gov.bd/ekpaypg/v1/merchant-api';

        $response = $client->post('https://sandbox.ekpay.gov.bd/ekpaypg/v1/merchant-api', [
            'headers' => [
                'Content-Type' => 'application/json',
                'Accept' => 'application/json',
            ],
            'body' => json_encode($post_data),
        ]);

        $response_data = json_decode($response->getBody(), true);
        $redirect_url = "https://sandbox.ekpay.gov.bd/ekpaypg/v1?sToken=" . $response_data['secure_token'] . "&trnsID=" . $tarnsactionId;
        $boatBooking->update([
            'transaction_id' => $tarnsactionId,
            'user_info' => json_encode($userInfo)
        ]);
        return redirect($redirect_url);
    }


    public function boatCabinBookingSuccess(Request $request, $id)
    {
        try {
            $decryptedId = Crypt::decryptString($id);
            $boatBooking = BoatBooking::find($decryptedId);
            $userInfo = json_decode($boatBooking->user_info);
            try {
                $phone = $userInfo->customer_phone;
                $message = __('Thank You For Your Booking! BookingId:' . $boatBooking->booking_id);
                $to = (string)PhoneNumber::make($phone)->ofCountry('BD');
                Sms::to($to)->content($message)->send();
            } catch (\Exception $e) {
                return response()->json([
                    'status'  => 0,
                    'action'  => 'showError',
                    'phone'   => $phone,
                    'message' => $e->getMessage()
                ]);
            }

            return view('Boat::Frontend.booking-success', ['boatBooking' => $boatBooking]);
        } catch (\Exception $e) {
            abort(404);
        }
    }

    public function boatCabinBookingSuccessByPayment(Request $request)
    {

        $transactionId = $request->input('tran_id');
        $amount = $request->input('amount');
        $status = $request->input('status');

        if ($status == 'VALID') {
            $booking = BoatBooking::where('transaction_id', $transactionId)->first();
            if ($booking) {
                $booking->payment_status = 'paid';
                $booking->booking_status = 'confirm';
                $booking->payment_method = 'sslcommerz';
                $booking->payment_info = json_encode($request->all());
                $booking->save();

                try {
                    $customerInfo = json_decode($booking->user_info);
                    $phone = $customerInfo->customer_phone;
                    $message = __('Thank you for your booking! Booking ID: ' . $booking->booking_id);
                    $to = (string)PhoneNumber::make($phone)->ofCountry('BD');
                    Sms::to($to)->content($message)->send();
                } catch (\Exception $e) {
                    \Log::error("Error sending SMS: " . $e->getMessage());

                    return response()->json([
                        'status'  => 0,
                        'action'  => 'showError',
                        'phone'   => $phone ?? 'unknown',
                        'message' => 'Error sending SMS: ' . $e->getMessage()
                    ]);
                }
                return view('Boat::Frontend.booking-success', ['boatBooking' => $booking]);
            } else {
                \Log::error("Booking not found for transaction: " . $transactionId);
                return response()->json(['message' => 'Booking not found'], 404);
            }
        } else {
            \Log::error("Payment not successful for transaction: " . $transactionId . " with status: " . $status);
            return response()->json(['message' => 'Payment not successful'], 400);
        }
    }


    // boat booking
    public function boatBooking(Request $request)
    {
        $boatId = $request->input('boat_id');
        $boat = Boat::find($boatId);
        $cabinIds = $boat->boatCabin()->pluck('id');
        // dd($request->all(), json_encode($cabinIds));
        $bookedDate = $request->input("booked_date");
        $person = $request->input('person');
        $personRate = $request->input('person_rate');
        $totalAmount = $request->input("total");
        $percentageOfBookingAmount = $boat->booking_percentage ?? 0;
        $bookingAmount = (float)$totalAmount * (float)$percentageOfBookingAmount / 100;
        $afterBookingAmount = (float)$totalAmount - (float)$bookingAmount;


        $boatBooking = BoatBooking::create([
            'boat_id' => $boatId,
            'destination_id' => $boat->destination->id,
            'user_id'       => auth()->user()->id ?? null,
            'cabin_ids'     => json_encode($cabinIds),
            'booking_date'  => Carbon::now(),
            'subtotal'      => $totalAmount,
            'total_amount' => $totalAmount,
            'booking_status' => 'pending',
            'payment_status' => "not paid",
            'booking_id' => (string) Str::uuid(),
            'booked_date' => $bookedDate,
            'booked_time' => $boat->check_in_time ?? '10:00',
            'booking_type' => 'boat',
            'persons' => $person,
            'person_rate' => $personRate,
            'booking_amount' => $bookingAmount ?? '',
            'after_booking_amount' => $afterBookingAmount ?? ''
        ]);

        foreach ($cabinIds ?? [] as $key => $cabinid) {
            $cabin = BoatCabin::find($cabinid);
            $boatBooking->boatBookingCabin()->create([
                'boat_id' => $boatId,
                'cabin_id' => $cabinid,
                'user_id' => auth()->user()->id ?? null,
                'cabin_price' => $cabin->price,
                'booking_date' => Carbon::now()->startOfDay()->format('Y-m-d'),
                'extra_person' => $request->input('extra_person')[$cabinid] ?? '',
                'total_amount' => $request->input('cabin_total')[$cabinid] ?? '',
            ]);
        }
        $encryptedId = Crypt::encryptString($boatBooking->id);
        return redirect()->route('boat.front.boatCabinBookingCheckout', ['id' => $encryptedId]);
    }


    public function boatBookingSuccessByPayment(Request $request, $transId)
    {
        // return $transId;
        $booking = BoatBooking::where('transaction_id', $transId)->first();
        $client = new Client();
        $post_data = [
            'trnx_id' => $transId,
            'trans_date' => Carbon::parse($booking->booking_date)->format('Y-m-d')
        ];


        $response = $client->post('https://sandbox.ekpay.gov.bd/ekpaypg/v1/get-status', [
            'headers' => [
                'Content-Type' => 'application/json',
                'Accept' => 'application/json',
            ],
            'body' => json_encode($post_data),
        ]);

        $response_data = json_decode($response->getBody(), true);
        // dd($request->all(), $response_data);
        $booking->payment_status = 'paid';
        $booking->booking_status = 'confirm';
        $booking->payment_method = 'ekpay';
        $booking->payment_info = json_encode($response_data);
        $booking->save();

        try {
            $customerInfo = json_decode($booking->user_info);
            $phone = $customerInfo->customer_phone;
            $message = __('Thank you for your booking! Booking ID: ' . $booking->booking_id);
            $to = (string)PhoneNumber::make($phone)->ofCountry('BD');
            Sms::to($to)->content($message)->send();
        } catch (\Exception $e) {
            \Log::error("Error sending SMS: " . $e->getMessage());

            return response()->json([
                'status'  => 0,
                'action'  => 'showError',
                'phone'   => $phone ?? 'unknown',
                'message' => 'Error sending SMS: ' . $e->getMessage()
            ]);
        }

        return view('Boat::Frontend.booking-success', ['boatBooking' => $booking]);
    }


    public function boatBookingPrint($id)
    {
        $boatBooking = BoatBooking::with('boatBookingCabin', 'boat')->find($id);
        $customerInfo = json_decode($boatBooking->user_info);
        // Load the invoice view and pass data
        $html = view('Boat::Frontend.booking_print', compact('boatBooking', 'customerInfo'))->render();

        // Initialize mPDF and generate PDF
        $mpdf = new Mpdf();
        $mpdf->WriteHTML($html);

        // Output PDF as a download
        $mpdf->Output('invoice.pdf', 'D');
    }
}
