<?php
namespace Modules\Hotel\Models;

use App\Currency;
use Carbon\Carbon;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Modules\Booking\Models\Bookable;
use Modules\Booking\Models\Booking;
use Modules\Booking\Traits\CapturesService;
use Modules\Core\Models\Attributes;
use Modules\Core\Models\SEO;
use Modules\Core\Models\Terms;
use Modules\Location\Models\Location;
use Modules\Media\Helpers\FileHelper;
use Modules\Review\Models\Review;
use Illuminate\Database\Eloquent\SoftDeletes;
use Modules\User\Models\UserWishList;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Log;

class Hotel extends Bookable
{
    use SoftDeletes;
    use Notifiable;
    use CapturesService;
    protected $table                              = 'bravo_hotels';
    public    $type                               = 'hotel';
    public    $checkout_booking_detail_file       = 'Hotel::frontend/booking/detail';
    public    $checkout_booking_detail_file_admin       = 'Booking::admin/booking/detail';
    public    $checkout_booking_detail_modal_file = 'Hotel::frontend/booking/detail-modal';

    public    $set_paid_modal_file                = 'Hotel::frontend/booking/set-paid-modal';
    public    $email_new_booking_file             = 'Hotel::emails.new_booking_detail';
    protected $fillable      = [
        'title',
        'content',
        'status',
    ];
    protected $slugField     = 'slug';
    protected $slugFromField = 'title';
    protected $seo_type      = 'hotel';
    protected $casts = [
        'policy' => 'array',
        'extra_price' => 'array',
        'service_fee' => 'array',
        'surrounding' => 'array',
    ];
    protected $bookingClass;
    protected $reviewClass;
    protected $hotelDateClass;
    protected $hotelTermClass;
    protected $hotelTranslationClass;
    protected $userWishListClass;
    protected $termClass;
    protected $attributeClass;
    protected $roomClass;
    protected $tmp_rooms = [];

    protected $translation_class = HotelTranslation::class;

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);
        $this->bookingClass = Booking::class;
        $this->reviewClass = Review::class;
        $this->hotelTermClass = HotelTerm::class;
        $this->hotelTranslationClass = HotelTranslation::class;
        $this->userWishListClass = UserWishList::class;
        $this->termClass = Terms::class;
        $this->attributeClass = Attributes::class;
        $this->roomClass = HotelRoom::class;
    }

    public static function getModelName()
    {
        return __("Hotel");
    }

    public static function getTableName()
    {
        return with(new static)->table;
    }

    /**
     * Get SEO fop page list
     *
     * @return mixed
     */
    static public function getSeoMetaForPageList()
    {
        $meta['seo_title'] = __("Search for Spaces");
        if (!empty($title = setting_item_with_lang("hotel_page_list_seo_title", false))) {
            $meta['seo_title'] = $title;
        } else if (!empty($title = setting_item_with_lang("hotel_page_search_title"))) {
            $meta['seo_title'] = $title;
        }
        $meta['seo_image'] = null;
        if (!empty($title = setting_item("hotel_page_list_seo_image"))) {
            $meta['seo_image'] = $title;
        } else if (!empty($title = setting_item("hotel_page_search_banner"))) {
            $meta['seo_image'] = $title;
        }
        $meta['seo_desc'] = setting_item_with_lang("hotel_page_list_seo_desc");
        $meta['seo_share'] = setting_item_with_lang("hotel_page_list_seo_share");
        $meta['full_url'] = url()->current();
        return $meta;
    }

    public function terms()
    {
        return $this->hasMany($this->hotelTermClass, "target_id");
    }

    public function termsByAttributeInListingPage()
    {
        $attribute = setting_item("hotel_attribute_show_in_listing_page", 0);
        return $this->hasManyThrough($this->termClass, $this->hotelTermClass, 'target_id', 'id', 'id', 'term_id')->where('bravo_terms.attr_id', $attribute)->with(['translation']);
    }

    public function getAttributeInListingPage()
    {
        $attribute_id = setting_item("hotel_attribute_show_in_listing_page", 0);
        $attribute = $this->attributeClass::find($attribute_id);
        return $attribute ?? false;
    }

    public function getDetailUrl($include_param = true)
    {
        $param = [];
        if ($include_param) {
            if (!empty($date = request()->input('date'))) {
                $dates = explode(" - ", $date);
                if (!empty($dates)) {
                    $param['start'] = $dates[0] ?? "";
                    $param['end'] = $dates[1] ?? "";
                }
            }
            if (!empty($adults = request()->input('adults'))) {
                $param['adults'] = $adults;
            }
            if (!empty($children = request()->input('children'))) {
                $param['children'] = $children;
            }
            if (!empty($room = request()->input('room'))) {
                $param['room'] = $room;
            }
        }
        $urlDetail = app_get_locale(false, false, '/') . config('hotel.hotel_route_prefix') . "/" . $this->slug;
        if (!empty($param)) {
            $urlDetail .= "?" . http_build_query($param);
        }
        return url($urlDetail);
    }


    public function getDetailUrlForAgent($include_param = true)
    {
        $param = [];
        if ($include_param) {
            if (!empty($date = request()->input('date'))) {
                $dates = explode(" - ", $date);
                if (!empty($dates)) {
                    $param['start'] = $dates[0] ?? "";
                    $param['end'] = $dates[1] ?? "";
                }
            }
            if (!empty($adults = request()->input('adults'))) {
                $param['adults'] = $adults;
            }
            if (!empty($children = request()->input('children'))) {
                $param['children'] = $children;
            }
            if (!empty($room = request()->input('room'))) {
                $param['room'] = $room;
            }
        }
        $urlDetail = app_get_locale(false, false, '/') .'agent/booking/hotel'. "/" . $this->slug;
        if (!empty($param)) {
            $urlDetail .= "?" . http_build_query($param);
        }
        return url($urlDetail);
    }

    public function getDetailUrlForAdmin($include_param = true){
        $param = [];
        if ($include_param) {
            if (!empty($date = request()->input('date'))) {
                $dates = explode(" - ", $date);
                if (!empty($dates)) {
                    $param['start'] = $dates[0] ?? "";
                    $param['end'] = $dates[1] ?? "";
                }
            }
            if (!empty($adults = request()->input('adults'))) {
                $param['adults'] = $adults;
            }
            if (!empty($children = request()->input('children'))) {
                $param['children'] = $children;
            }
            if (!empty($room = request()->input('room'))) {
                $param['room'] = $room;
            }
        }
        $urlDetail = app_get_locale(false, false, '/') .'admin/module/booking/manual/hotel'. "/" . $this->slug;
        if (!empty($param)) {
            $urlDetail .= "?" . http_build_query($param);
        }
        return url($urlDetail);
    }




    public static function getLinkForPageSearch($locale = false, $param = [])
    {

        return url(app_get_locale(false, false, '/') . config('hotel.hotel_route_prefix') . "?" . http_build_query($param));
    }


    public function getEditUrl()
    {
        return url(route('hotel.admin.edit', ['id' => $this->id]));
    }

    public function getDiscountPercentAttribute()
    {
        if (!empty($this->price) and $this->price > 0 and !empty($this->sale_price) and $this->sale_price > 0 and $this->price > $this->sale_price) {
            $percent = 100 - ceil($this->sale_price / ($this->price / 100));
            return $percent . "%";
        }
    }

    public function fill(array $attributes)
    {
        if (!empty($attributes)) {
            foreach ($this->fillable as $item) {
                $attributes[$item] = $attributes[$item] ?? null;
            }
        }
        return parent::fill($attributes); // TODO: Change the autogenerated stub
    }

    public function isBookable()
    {
        if ($this->status != 'publish')
            return false;
        return parent::isBookable();
    }

    public function addToCart(Request $request){

        $res = $this->addToCartValidate($request);
        if($res !== true) return $res;

        // Add Booking
        // $total_guests = $request->input('adults') + $request->input('children');

	    $total = 0;
        $total_room_selected = 0;
        $total_adults = 0;
        $total_chiled = 0;
        $total_duration_in_hour = 0;

        if (!empty($this->tmp_selected_rooms)) {

            $totalExtraPrice = 0;
            $total_service_fee = 0;

            foreach ($this->tmp_selected_rooms as $room) {

                $room_by_id = $this->roomClass::find($room['id']);

                if (isset($room_by_id->id)) {

                    $startDateTime = Carbon::createFromFormat('d/m/Y', $room['start']);
                    $start_date = $startDateTime->format('Y-m-d H:i:s');

                    $endDateTime = Carbon::createFromFormat('d/m/Y', $room['end']);
                    $end_date = $endDateTime->format('Y-m-d H:i:s');

                    // Convert formatted date strings to Carbon objects
                    $start_date_carbon = Carbon::createFromFormat('Y-m-d H:i:s', $start_date);
                    $end_date_carbon = Carbon::createFromFormat('Y-m-d H:i:s', $end_date);

                    // Calculate duration in hours
                    $duration_in_hour = max(1, ceil(($end_date_carbon->getTimestamp() - $start_date_carbon->getTimestamp()) / HOUR_IN_SECONDS));

                    if (!$start_date || !$end_date) {
                        return $this->sendError(__("Invalid date format"));
                    }

                    $duration_in_day = $duration_in_hour/24;

                    $total_duration_in_hour += $duration_in_hour;

                    $total += ($room_by_id->price*$duration_in_day) * $room['number_selected'];
                    $total_adults += $room['adults'];
                    $total_chiled += $room['children'];
                    $total_room_selected += $room['number_selected'];


                    $roomTotalExtraPrice = 0;
                    if(isset($room['extraPrices'])){
                        foreach ($room['extraPrices'] as $k => $type) {

                            $extra_price_type = $type['type'];
                            $per_person = $type['per_person'];
                            $extra_price = $type['price'];

                            if ($extra_price_type == "one_time") {
                                if ($per_person == "on") {
                                    $roomTotalExtraPrice += $extra_price * $room['adults'];
                                } else {
                                    $roomTotalExtraPrice += $extra_price;
                                }
                            }

                            if ($extra_price_type == "per_day") {
                                if ($per_person == "on") {
                                    $extra_price_for_day = $extra_price * $duration_in_day;
                                    $price_for_all_day = $extra_price_for_day * $room['adults'];
                                    $roomTotalExtraPrice += $price_for_all_day;
                                } else {
                                    $extra_price_for_one_day = $extra_price;
                                    $price_for_all_day = $extra_price_for_one_day * $duration_in_day;
                                    $roomTotalExtraPrice += $price_for_all_day;
                                }
                            }

                        }
                    }
                    $totalExtraPrice += $roomTotalExtraPrice;


                    //Service Fees for Vendor
                    $roomServiceFee = 0;
                    if(isset($room['serviceFees'])){
                        $roomServiceFee = $this->calculateServiceFees($room['serviceFees'] , $total , $room['adults']);
                    }
                    $total_service_fee += $roomServiceFee;

                }




                $total += $roomTotalExtraPrice;
                $total += $roomServiceFee;

            }


        }




        //Buyer Fees for Admin
        $total_before_fees = $total;
        $total_buyer_fee = 0;
        if (!empty($list_buyer_fees = setting_item('hotel_booking_buyer_fees'))) {
            $list_fees = json_decode($list_buyer_fees, true);
            $total_buyer_fee = $this->calculateServiceFees($list_fees , $total_before_fees , $total_adults);
            $total += $total_buyer_fee;
        }



        $booking = new $this->bookingClass();
        $booking->status = 'draft';
        $booking->object_id = $request->input('service_id');
        $booking->object_model = $request->input('service_type');
        $booking->vendor_id = $this->author_id;

        if($request->input('agent_booking')){
            $booking->agent_id = auth()->user()->id;
            $booking->customer_id = null;
        }else{
            $booking->agent_id = null;
            $booking->customer_id = Auth::id();
        }

        $booking->total = $total;
        $booking->total_guests = $total_adults;
        $booking->start_date = null;
        $booking->end_date = null;

        // $booking->start_date = $start_date->format('Y-m-d H:i:s');
        // $booking->end_date = $end_date->format('Y-m-d H:i:s');
        // $booking->vendor_service_fee_amount = $total_service_fee ?? '';
        // $booking->vendor_service_fee = $list_service_fee ?? '';


        $booking->buyer_fees = $list_buyer_fees ?? '';
        $booking->total_before_fees = $total_before_fees;
        $booking->total_before_discount = $total_before_fees;

        $booking->calculateCommission();

        if($this->isDepositEnable()){
            $booking_deposit_fomular = $this->getDepositFomular();
            $tmp_price_total = $booking->total;
            if($booking_deposit_fomular == "deposit_and_fee"){
                $tmp_price_total = $booking->total_before_fees;
            }

            switch ($this->getDepositType()){
                case "percent":
                    $booking->deposit = $tmp_price_total * $this->getDepositAmount() / 100;
                    break;
                default:
                    $booking->deposit = $this->getDepositAmount();
                    break;
            }
            if($booking_deposit_fomular == "deposit_and_fee"){
                $booking->deposit = $booking->deposit + $total_buyer_fee + $total_service_fee;
            }
        }

        $check = $booking->save();


        if ($check) {

            $this->bookingClass::clearDraftBookings();

            $booking->addMeta('duration', $this->duration);
            $booking->addMeta('base_price', $this->price);
            $booking->addMeta('sale_price', $this->sale_price);

            $booking->addMeta('guests', $total_adults);
            $booking->addMeta('adults', $total_adults);
            $booking->addMeta('children', $total_chiled);

            $booking->addMeta('vendor_service_fee_amount', $total_service_fee);
            $booking->addMeta('total_extra_price', $totalExtraPrice);

            if($this->isDepositEnable()){
                $booking->addMeta('deposit_info',[
                    'type'=>$this->getDepositType(),
                    'amount'=>$this->getDepositAmount(),
                    'fomular'=>$this->getDepositFomular(),
                ]);
            }

            // Add Room Booking
            if (!empty($this->tmp_selected_rooms)) {

                $total_guests = 0;
                foreach ($this->tmp_selected_rooms as $room) {

                    $room_by_id = $this->roomClass::find($room['id']);


                    $startDateTime = Carbon::createFromFormat('d/m/Y', $room['start']);
                    $start_date = $startDateTime->format('Y-m-d H:i:s');

                    $endDateTime = Carbon::createFromFormat('d/m/Y', $room['end']);
                    // Format the Carbon object to 'Y-m-d H:i:s' format
                    $end_date = $endDateTime->format('Y-m-d H:i:s');


                    $adults_and_chiled = $room['adults']+$room['children'];
                    $total_guests +=$adults_and_chiled;



                    $r_ServiceFee = 0;
                    if(isset($room['serviceFees'])){
                        $r_ServiceFee = $this->calculateServiceFees($room['serviceFees'] , $total , $room['adults']);
                    }


                    $r_TotalExtraPrice = 0;
                    if(isset($room['extraPrices'])){
                        foreach ($room['extraPrices'] as $k => $type) {

                            $extra_price_type = $type['type'];
                            $per_person = $type['per_person'];
                            $extra_price = $type['price'];

                            if ($extra_price_type == "one_time") {
                                if ($per_person == "on") {
                                    $r_TotalExtraPrice += $extra_price * $room['adults'];
                                } else {
                                    $r_TotalExtraPrice += $extra_price;
                                }
                            }

                            if ($extra_price_type == "per_day") {
                                if ($per_person == "on") {
                                    $extra_price_for_day = $extra_price * $duration_in_day;
                                    $price_for_all_day = $extra_price_for_day * $room['adults'];
                                    $roomTotalExtraPrice += $price_for_all_day;
                                } else {
                                    $extra_price_for_one_day = $extra_price;
                                    $price_for_all_day = $extra_price_for_one_day * $duration_in_day;
                                    $r_TotalExtraPrice += $price_for_all_day;
                                }
                            }

                        }
                    }


                    if (isset($room_by_id->id)) {

                        $hotelRoomBooking = new HotelRoomBooking();

                        $hotelRoomBooking->fillByAttr([
                            'room_id',
                            'parent_id',
                            'start_date',
                            'end_date',
                            'total_guests',

                            'adults',
                            'children',

                            'number',
                            'booking_id',
                            'price',

                            'vendor_service_fee',
                            'vendor_service_fee_amount',

                            'extra_prices',
                            'total_extra_price'


                        ], [
                            'room_id'    => $room['id'],
                            'parent_id'  => $this->id,
                            'start_date' => $start_date,
                            'end_date'   => $end_date,
                            'total_guests'   => $total_guests,

                            'adults'   =>  $room['adults'],
                            'children'   => $room['children'],

                            'number'     => $room['number_selected'],
                            'booking_id' => $booking->id,
                            'price'      => ($room_by_id->price*$duration_in_day) * $room['number_selected'],

                            'vendor_service_fee' => isset($room['serviceFees']) ? $room['serviceFees'] : null,
                            'vendor_service_fee_amount' => $r_ServiceFee ? $r_ServiceFee : 0,


                            'extra_prices' => isset($room['extraPrices']) ? $room['extraPrices'] : null,
                            'total_extra_price' => $r_TotalExtraPrice ? $r_TotalExtraPrice : 0


                        ]);
                        $hotelRoomBooking->save();

                    }

                }
            }

            return $this->sendSuccess([
                'url' => $booking->getCheckoutUrl(),
                'booking_code' => $booking->code,
            ]);

        }

        return $this->sendError(__("Can not check availability"));

    }


    public function addToCartValidate(Request $request) {

        $rules = [
            'rooms'      => 'required',
        ];
        // Validation
        if (!empty($rules)) {
            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
                return $this->sendError('', ['errors' => $validator->errors()]);
            }
        }
        $total_rooms = array_sum(array_column($request->input(
            'rooms',
            'number_selected'
        ), "number_selected"));

        $selected_rooms = Arr::where($request->input('rooms'), function ($value, $key) {
            return !empty($value['number_selected']) and $value['number_selected'] > 0;
        });

        if ($total_rooms <= 0 or empty($selected_rooms)) {
            return $this->sendError(__("Please select at lease one room"));
        }

        $total_adult_select = 0;
        $total_child_select = 0;
        foreach ($selected_rooms as $room) {

            $room_by_id = $this->roomClass::find($room['id']);

            $start_date = $room['start'];
            $end_date = $room['end'];
            $adults = $room['adults'];
            $children = $room['children'];

            $numberDays = ( abs(strtotime($end_date) - strtotime($start_date)) / 86400 ) + 1;

            if(!empty($room_by_id->min_day_stays) and  $numberDays < $room_by_id->min_day_stays){
                return $this->sendError(__("The :name need to select at least :number days",['name'=>$room_by_id->title,'number'=>$room_by_id->min_day_stays]));
            }

            if(!empty($room_by_id->id)){
                $total_adult_select = $room_by_id->adults * $room['number_selected'];
                $total_child_select = $room_by_id->children * $room['number_selected'];
            }

            if($adults > $total_adult_select){
                return $this->sendError(__("Sorry, the current rooms are not enough for adults"));
            }
            if($children > $total_child_select){
                return $this->sendError(__("Sorry, the current rooms are not enough for children"));
            }

        }

        $this->tmp_selected_rooms = $selected_rooms;
        return true;

    }

    public function beforeCheckout(Request $request, $booking)
    {
        $filters = [
            "start_date"=>$booking->start_date,
            "end_date"=>$booking->end_date,
            "adults"=>$booking->getMeta("adults"),
            "children"=>$booking->getMeta("children"),
        ];
        $roomsBookings = HotelRoomBooking::select("room_id")->where("booking_id",$booking->id)->get();
        $room_ids = $roomsBookings->pluck('room_id')->toArray();
        $rooms = HotelRoom::whereIn('id',$room_ids)->get();
        foreach ($rooms as $room) {
            if (!$room->isAvailableAt($filters)) {
                return $this->sendError(__("There is no room available at your selected dates"));
            }
        }
    }

    public function isAvailableInRanges($start_date, $end_date)
    {

        $days = max(1, floor((strtotime($end_date) - strtotime($start_date)) / DAY_IN_SECONDS));
        if ($this->default_state) {
            $notAvailableDates = $this->hotelDateClass::query()->where([
                [
                    'start_date',
                    '>=',
                    $start_date
                ],
                [
                    'end_date',
                    '<=',
                    $end_date
                ],
                [
                    'active',
                    '0'
                ]
            ])->count('id');
            if ($notAvailableDates)
                return false;
        } else {
            $availableDates = $this->hotelDateClass::query()->where([
                [
                    'start_date',
                    '>=',
                    $start_date
                ],
                [
                    'end_date',
                    '<=',
                    $end_date
                ],
                [
                    'active',
                    '=',
                    1
                ]
            ])->count('id');
            if ($availableDates <= $days)
                return false;
        }
        // Check Order
        $bookingInRanges = $this->bookingClass::getAcceptedBookingQuery($this->id, $this->type)->where([
            [
                'end_date',
                '>=',
                $start_date
            ],
            [
                'start_date',
                '<=',
                $end_date
            ],
        ])->count('id');
        if ($bookingInRanges) {
            return false;
        }
        return true;
    }

    public function getBookingData()
    {

        if (!empty($start = request()->input('start'))) {
            $start_html = display_date($start);
            $end_html = request()->input('end') ? display_date(request()->input('end')) : "";
            $date_html = $start_html . '<i class="fa fa-long-arrow-right" style="font-size: inherit"></i>' . $end_html;
        }
        $booking_data = [
            'id'              => $this->id,
            'person_types'    => [],
            'max'             => 0,
            'open_hours'      => [],
            'extra_price'     => [],
            'minDate'         => date('m/d/Y'),
            'max_guests'      => $this->max_guests ?? 1,
            'buyer_fees'      => [],
            'i18n'            => [
                'date_required' => __("Please select check-in and check-out date"),
                "rooms"         => __('rooms'),
                "room"          => __('room'),
            ],
            'start_date'      => request()->input('start') ?? "",
            'start_date_html' => $date_html ?? __('Please select'),
            'end_date'        => request()->input('end') ?? "",
            'deposit'=>$this->isDepositEnable(),
            'deposit_type'=>$this->getDepositType(),
            'deposit_amount'=>$this->getDepositAmount(),
            'deposit_fomular'=>$this->getDepositFomular(),
            'is_form_enquiry_and_book'=> $this->isFormEnquiryAndBook(),
            'enquiry_type'=> $this->getBookingEnquiryType(),
        ];
        if (!empty($adults = request()->input('adults'))) {
            $booking_data['adults'] = $adults;
        }
        if (!empty($children = request()->input('children'))) {
            $booking_data['children'] = $children;
        }
        if (!empty($children = request()->input('room'))) {
            $booking_data['room'] = $children;
        }
        $lang = app()->getLocale();
        if ($this->enable_extra_price) {
            $booking_data['extra_price'] = $this->extra_price;
            if (!empty($booking_data['extra_price'])) {
                foreach ($booking_data['extra_price'] as $k => &$type) {
                    if (!empty($lang) and !empty($type['name_' . $lang])) {
                        $type['name'] = $type['name_' . $lang];
                    }
                    $type['number'] = 0;
                    $type['enable'] = 0;
                    $type['price_html'] = format_money($type['price']);
                    $type['price_type'] = '';
                    switch ($type['type']) {
                        case "per_day":
                            $type['price_type'] .= '/' . __('day');
                            break;
                    }
                    if (!empty($type['per_person'])) {
                        $type['price_type'] .= '/' . __('guest');
                    }
                }
            }
            $booking_data['extra_price'] = array_values((array)$booking_data['extra_price']);
        }
        $list_fees = setting_item_array('hotel_booking_buyer_fees');
        if (!empty($list_fees)) {
            foreach ($list_fees as $item) {
                $item['type_name'] = $item['name_' . app()->getLocale()] ?? $item['name'] ?? '';
                $item['type_desc'] = $item['desc_' . app()->getLocale()] ?? $item['desc'] ?? '';
                $item['price_type'] = '';
                if (!empty($item['per_person']) and $item['per_person'] == 'on') {
                    $item['price_type'] .= '/' . __('guest');
                }
                $booking_data['buyer_fees'][] = $item;
            }
        }
        if(!empty($this->enable_service_fee) and !empty($service_fee = $this->service_fee)){
            foreach ($service_fee as $item) {
                $item['type_name'] = $item['name_' . app()->getLocale()] ?? $item['name'] ?? '';
                $item['type_desc'] = $item['desc_' . app()->getLocale()] ?? $item['desc'] ?? '';
                $item['price_type'] = '';
                if (!empty($item['per_person']) and $item['per_person'] == 'on') {
                    $item['price_type'] .= '/' . __('guest');
                }
                $booking_data['buyer_fees'][] = $item;
            }
        }
        return $booking_data;
    }

    public static function searchForMenu($q = false)
    {
        $query = static::select('id', 'title as name');
        if (strlen($q)) {

            $query->where('title', 'like', "%" . $q . "%");
        }
        $a = $query->orderBy('id', 'desc')->limit(10)->get();
        return $a;
    }

    public static function getMinMaxPrice()
    {
        $model = parent::selectRaw('MIN( price ) AS min_price ,
                                    MAX( price ) AS max_price ')->where("status", "publish")->first();
        if (empty($model->min_price) and empty($model->max_price)) {
            return [
                0,
                100
            ];
        }
        return [
            $model->min_price,
            $model->max_price
        ];
    }

    public function getReviewEnable()
    {
        return setting_item("hotel_enable_review", 0);
    }

    public function getReviewApproved()
    {
        return setting_item("hotel_review_approved", 0);
    }

    public function review_after_booking(){
        return setting_item("hotel_enable_review_after_booking", 0);
    }

    public function count_remain_review()
    {
        $status_making_completed_booking = [];
        $options = setting_item("hotel_allow_review_after_making_completed_booking", false);
        if (!empty($options)) {
            $status_making_completed_booking = json_decode($options);
        }
        $number_review = $this->reviewClass::countReviewByServiceID($this->id, Auth::id(), false, $this->type) ?? 0;
        $number_booking = $this->bookingClass::countBookingByServiceID($this->id, Auth::id(),$status_making_completed_booking) ?? 0;
        $number = $number_booking - $number_review;
        if($number < 0) $number = 0;
        return $number;
    }

    public static function getReviewStats()
    {
        $reviewStats = [];
        if (!empty($list = setting_item("hotel_review_stats", []))) {
            $list = json_decode($list, true);
            foreach ($list as $item) {
                $reviewStats[] = $item['title'];
            }
        }
        return $reviewStats;
    }

    public function getReviewDataAttribute()
    {
        $list_score = [
            'score_total'  => 0,
            'score_text'   => __("Not rated"),
            'total_review' => 0,
            'rate_score'   => [],
        ];
        $dataTotalReview = $this->reviewClass::selectRaw(" AVG(rate_number) as score_total , COUNT(id) as total_review ")->where('object_id', $this->id)->where('object_model', $this->type)->where("status", "approved")->first();
        if (!empty($dataTotalReview->score_total)) {
            $list_score['score_total'] = number_format($dataTotalReview->score_total, 1);
            $list_score['score_text'] = Review::getDisplayTextScoreByLever(round($list_score['score_total']));
        }
        if (!empty($dataTotalReview->total_review)) {
            $list_score['total_review'] = $dataTotalReview->total_review;
        }
        $list_data_rate = $this->reviewClass::selectRaw('COUNT( CASE WHEN rate_number = 5 THEN rate_number ELSE NULL END ) AS rate_5,
                                                            COUNT( CASE WHEN rate_number = 4 THEN rate_number ELSE NULL END ) AS rate_4,
                                                            COUNT( CASE WHEN rate_number = 3 THEN rate_number ELSE NULL END ) AS rate_3,
                                                            COUNT( CASE WHEN rate_number = 2 THEN rate_number ELSE NULL END ) AS rate_2,
                                                            COUNT( CASE WHEN rate_number = 1 THEN rate_number ELSE NULL END ) AS rate_1 ')->where('object_id', $this->id)->where('object_model', $this->type)->where("status", "approved")->first()->toArray();
        for ($rate = 5; $rate >= 1; $rate--) {
            if (!empty($number = $list_data_rate['rate_' . $rate])) {
                $percent = ($number / $list_score['total_review']) * 100;
            } else {
                $percent = 0;
            }
            $list_score['rate_score'][$rate] = [
                'title'   => $this->reviewClass::getDisplayTextScoreByLever($rate),
                'total'   => $number,
                'percent' => round($percent),
            ];
        }
        return $list_score;
    }

    /**
     * Get Score Review
     *
     * Using for loop hotel
     */
    public function getScoreReview()
    {
        $hotel_id = $this->id;
        $list_score = Cache::rememberForever('review_' . $this->type . '_' . $hotel_id, function () use ($hotel_id) {
            $dataReview = $this->reviewClass::selectRaw(" AVG(rate_number) as score_total , COUNT(id) as total_review ")->where('object_id', $hotel_id)->where('object_model', "hotel")->where("status", "approved")->first();
            $score_total = !empty($dataReview->score_total) ? number_format($dataReview->score_total, 1) : 0;
            return [
                'score_total'  => $score_total,
                'total_review' => !empty($dataReview->total_review) ? $dataReview->total_review : 0,
            ];
        });
        $list_score['review_text'] = $list_score['score_total'] ? Review::getDisplayTextScoreByLever(round($list_score['score_total'])) : __("Not rated");
        return $list_score;
    }

    public function getNumberReviewsInService($status = false)
    {
        return $this->reviewClass::countReviewByServiceID($this->id, false, $status, $this->type) ?? 0;
    }

    public function getReviewList(){
        return $this->reviewClass::select(['id','title','content','rate_number','author_ip','status','created_at','vendor_id','author_id'])->where('object_id', $this->id)->where('object_model', 'hotel')->where("status", "approved")->orderBy("id", "desc")->with('author')->paginate(setting_item('hotel_review_number_per_page', 5));
    }

    public function getNumberServiceInLocation($location)
    {
        $number = 0;
        if (!empty($location)) {
            $number = parent::join('bravo_locations', function ($join) use ($location) {
                $join->on('bravo_locations.id', '=', $this->table . '.location_id')->where('bravo_locations._lft', '>=', $location->_lft)->where('bravo_locations._rgt', '<=', $location->_rgt);
            })->where($this->table . ".status", "publish")->with(['translation'])->count($this->table . ".id");
        }
        if (empty($number))
            return false;
        if ($number > 1) {
            return __(":number Hotels", ['number' => $number]);
        }
        return __(":number Hotel", ['number' => $number]);
    }

    /**
     * @param $from
     * @param $to
     * @return \Illuminate\Database\Eloquent\Builder[]|\Illuminate\Database\Eloquent\Collection
     */
    public function getBookingsInRange($from, $to)
    {

        $query = $this->bookingClass::query();
        $query->whereNotIn('status', ['draft']);
        $query->where('start_date', '<=', $to)->where('end_date', '>=', $from)->take(100);
        $query->where('object_id', $this->id);
        $query->where('object_model', $this->type);
        return $query->orderBy('id', 'asc')->get();
    }

    public function saveCloneByID($clone_id)
    {
        $old = parent::find($clone_id);
        if (empty($old))
            return false;
        $selected_terms = $old->terms->pluck('term_id');
        $old->title = $old->title . " - Copy";
        $new = $old->replicate();
        $new->status = 'draft';
        $new->save();
        //Terms
        foreach ($selected_terms as $term_id) {
            $this->hotelTermClass::firstOrCreate([
                'term_id'   => $term_id,
                'target_id' => $new->id
            ]);
        }
        //Language
        $langs = $this->hotelTranslationClass::where("origin_id", $old->id)->get();
        if (!empty($langs)) {
            foreach ($langs as $lang) {
                $langNew = $lang->replicate();
                $langNew->origin_id = $new->id;
                $langNew->save();
                $langSeo = SEO::where('object_id', $lang->id)->where('object_model', $lang->getSeoType() . "_" . $lang->locale)->first();
                if (!empty($langSeo)) {
                    $langSeoNew = $langSeo->replicate();
                    $langSeoNew->object_id = $langNew->id;
                    $langSeoNew->save();
                }
            }
        }
        //SEO
        $metaSeo = SEO::where('object_id', $old->id)->where('object_model', $this->seo_type)->first();
        if (!empty($metaSeo)) {
            $metaSeoNew = $metaSeo->replicate();
            $metaSeoNew->object_id = $new->id;
            $metaSeoNew->save();
        }

        foreach ($old->rooms as $room) {
            $room->saveClone($new->id);
        }
    }

    public function hasWishList()
    {
        return $this->hasOne($this->userWishListClass, 'object_id', 'id')->where('object_model', $this->type)->where('user_id', Auth::id() ?? 0);
    }

    public function isWishList()
    {
        if (Auth::check()) {
            if (!empty($this->hasWishList) and !empty($this->hasWishList->id)) {
                return 'active';
            }
        }
        return '';
    }

    public static function getServiceIconFeatured()
    {
        return "fa fa-building-o";
    }

    public function rooms()
    {
        return $this->hasMany($this->roomClass, 'parent_id')->where('status', "publish");
    }

    public function getRoomsAvailability($filters = [])
    {
        $rooms = $this->rooms;
        $res = [];
        $this->tmp_rooms = [];
        foreach ($rooms as $room) {
            if ($room->isAvailableAt($filters)) {
                $translation = $room->translate();
                $terms = Terms::getTermsByIdForAPI($room->terms->pluck('term_id'));
                $term_features = [];
                $i = 0;
                if(!empty($terms)){
                    foreach ($terms as $term){
                        if(!empty($term['child'])){
                            foreach ($term['child'] as $child){
                                $term_features[] = [
                                    'icon' => $child['icon'] ?? 'fa fa-smile-o',
                                    'title' => $child['title']
                                ];
                                $i ++;
                                if ($i == 5) break;
                            }
                        }
                        if ($i == 5) break;
                    }
                }
                $res[] = [
                    'id'              => $room->id,
                    'title'           => $translation->title,
                    'price'           => $room->tmp_price ?? 0,
                    'size_html'       => $room->size ? size_unit_format($room->size) : '',
                    'beds_html'       => $room->beds ? 'x' . $room->beds : '',
                    'adults_html'     => $room->adults ? 'x' . $room->adults : '',
                    'children_html'   => $room->children ? 'x' . $room->children : '',
                    'number_selected' => 0,
                    'number'          => (int)$room->tmp_number ?? 0,
                    'min_day_stays'   => $room->min_day_stays ?? 0,
                    'image'           => $room->image_id ? get_file_url($room->image_id, 'medium') : '',
                    'tmp_number'      => $room->tmp_number,
                    'gallery'         => $room->getGallery(),
                    'price_html'      => format_money($room->tmp_price) . '<span class="unit">/' . ($room->tmp_nights ? __(':count nights', ['count' => $room->tmp_nights]) : __(":count night", ['count' => $room->tmp_nights])) . '</span>',
                    'price_text'      => format_money($room->tmp_price) . '/' . ($room->tmp_nights ? __(':count nights', ['count' => $room->tmp_nights]) : __(":count night", ['count' => $room->tmp_nights])),
                    'terms'           => $terms,
                    'term_features'   => $term_features
                ];
                $this->tmp_rooms[] = $room;
            }
        }
        return $res;
    }

    public static function isEnable()
    {
        return setting_item('hotel_disable') == false;
    }

    public function isDepositEnable(){
        return (setting_item('hotel_deposit_enable') and setting_item('hotel_deposit_amount'));
    }
    public function getDepositAmount(){
        return setting_item('hotel_deposit_amount');
    }
    public function getDepositType(){
        return setting_item('hotel_deposit_type');
    }
    public function getDepositFomular(){
        return setting_item('hotel_deposit_fomular','default');
    }


    public function detailBookingEachDate($booking){
	    $rooms = \Modules\Hotel\Models\HotelRoomBooking::getByBookingId($booking->id);
	    $roomsIds = $rooms->pluck('room_id')->toArray();
	    $roomsNumber = $rooms->pluck('number','room_id')->toArray();
	    $startDate = $booking->start_date;
	    $endDate = $booking->end_date;
	    $query = HotelRoomDate::query();
	    $query->whereIn('target_id',$roomsIds);
	    $query->where('start_date','>=',date('Y-m-d H:i:s',strtotime($startDate)));
	    $query->where('end_date','<',date('Y-m-d H:i:s',strtotime($endDate)));
	    $roomsDates = $query->get();
	    $allDates=[];
	    foreach ($rooms as $r=> $room){
            $period = periodDate($startDate,$endDate,false);
            foreach ($period as $dt){
		    	$price = $room->room->price * $room->number;
			    $date['price'] =$price;
			    $date['price_html'] = format_money($price);
			    $date['from'] = $dt->getTimestamp();
			    $date['from_html'] = $dt->format('d/m/Y');
			    $date['to'] = $dt->getTimestamp();
			    $date['to_html'] = $dt->format('d/m/Y');
			    $allDates[$room->room_id][$dt->format('Y-m-d')] = $date;
		    }
	    }

	    if(!empty($roomsDates))
	    {
		    foreach ($roomsDates as $roomsDate)
		    {
			    $startDate = strtotime($roomsDate->start_date);
			    if($allDates[$roomsDate->target_id][date('Y-m-d',$startDate)])
                {
                    $price = $roomsDate->price * $roomsNumber[$roomsDate->target_id]??1;
                    $date['price'] = $price;
                    $date['price_html'] = format_money($price);
                    $date['from'] = $startDate;
                    $date['from_html'] = date('d/m/Y',$startDate);
                    $date['to'] = $startDate;
                    $date['to_html'] = date('d/m/Y',($startDate));
                    $allDates[$roomsDate->target_id][date('Y-m-d',$startDate)] = $date;
                }
		    }
	    }
	    return $allDates;
    }

    public static function isEnableEnquiry(){
        if(!empty(setting_item('booking_enquiry_for_hotel'))){
            return true;
        }
        return false;
    }

    public static function isFormEnquiryAndBook(){
        $check = setting_item('booking_enquiry_for_hotel');
        if(!empty($check) and setting_item('booking_enquiry_type_hotel') == "booking_and_enquiry" ){
            return true;
        }
        return false;
    }
    public static function getBookingEnquiryType(){
        $check = setting_item('booking_enquiry_for_hotel');
        if(!empty($check)){
            if( setting_item('booking_enquiry_type_hotel') == "only_enquiry" ) {
                return "enquiry";
            }
        }
        return "book";
    }


    public function search($request)
    {
        $model_hotel = parent::query()->select("bravo_hotels.*");
        $model_hotel->where("bravo_hotels.status", "publish");
        if (!empty($location_id = $request['location_id'] ?? "")) {
            $location = Location::query()->where('id', $location_id)->where("status","publish")->first();
            if(!empty($location)){
                $model_hotel->join('bravo_locations', function ($join) use ($location) {
                    $join->on('bravo_locations.id', '=', 'bravo_hotels.location_id')
                        ->where('bravo_locations._lft', '>=', $location->_lft)
                        ->where('bravo_locations._rgt', '<=', $location->_rgt);
                });
            }
        }
        if (!empty($request['location_ids'])) {
            // Only using block
            $model_hotel->whereIn('location_id', $request['location_ids']);
        }
        if (!empty($price_range = $request["price_range"] ?? "")) {
            $pri_from = Currency::convertPriceToMain(explode(";", $price_range)[0]);
            $pri_to =  Currency::convertPriceToMain(explode(";", $price_range)[1]);
            $model_hotel->whereBetween('bravo_hotels.price',[$pri_from,$pri_to]);
        }

        if (!empty($star_rate = $request['star_rate'] ?? "")) {
            $model_hotel->WhereIn('star_rate',$star_rate);
        }

        $terms = $request['terms'] ?? "";
        if($term_id = $request['term_id'] ?? "")
        {
            $terms[] = $term_id;
        }

        // Change term to AND search
        if (is_array($terms) and !empty($terms = array_filter(array_values($terms)))) {
            foreach ($terms as $index=>$termId){
                $model_hotel->join('bravo_hotel_term as tt'.$index, function($join) use ($termId,$index){
                    $join->on('tt'.$index.'.target_id', "bravo_hotels.id");
                    $join->where('tt'.$index.'.term_id', $termId);
                });
            }
        }

        if(!empty($request['attrs'])){
            $model_hotel = $this->filterAttrs($model_hotel,$request['attrs'],'bravo_hotel_term');
        }

        $review_scores = $request["review_score"] ?? "";
        if (is_array($review_scores)) $review_scores = array_filter($review_scores);
        if (!empty($review_scores) && count($review_scores)) {
            $model_hotel = $this->filterReviewScore($model_hotel,$review_scores);
        }

        if(!empty( $service_name = $request["service_name"] ?? "" ))
        {
            if( setting_item('site_enable_multi_lang') && setting_item('site_locale') != app()->getLocale() )
            {
                $model_hotel->leftJoin('bravo_hotel_translations', function ($join) {
                    $join->on('bravo_hotels.id', '=', 'bravo_hotel_translations.origin_id');
                });
                $model_hotel->where('bravo_hotel_translations.title', 'LIKE', '%' . $service_name . '%');

            }
            else
            {
                $model_hotel->where('bravo_hotels.title', 'LIKE', '%' . $service_name . '%');
            }
        }
        if(!empty($lat = $request["map_lat"] ?? "") and !empty($lgn = $request["map_lgn"] ?? "") and !empty($request["map_place"] ?? ""))
        {
            $model_hotel = $this->filterLatLng($model_hotel,$lat,$lgn);
        }

        if(!empty($request['is_featured']))
        {
            $model_hotel->where('bravo_hotels.is_featured',1);
        }
        if (!empty($request['custom_ids']) and !empty( $ids = array_filter($request['custom_ids']) )) {
            $model_hotel->whereIn("bravo_hotels.id", $ids);
            $model_hotel->orderByRaw('FIELD (id, ' . implode(', ', $ids) . ') ASC');
        }
        $orderby = $request["orderby"] ?? "";
        switch ($orderby){
            case "price_low_high":
                $raw_sql = "CASE WHEN IFNULL( bravo_hotels.sale_price, 0 ) > 0 THEN bravo_hotels.sale_price ELSE bravo_hotels.price END AS tmp_min_price";
                $model_hotel->selectRaw($raw_sql);
                $model_hotel->orderBy("tmp_min_price", "asc");
                break;
            case "price_high_low":
                $raw_sql = "CASE WHEN IFNULL( bravo_hotels.sale_price, 0 ) > 0 THEN bravo_hotels.sale_price ELSE bravo_hotels.price END AS tmp_min_price";
                $model_hotel->selectRaw($raw_sql);
                $model_hotel->orderBy("tmp_min_price", "desc");
                break;
            case "rate_high_low":
                $model_hotel->orderBy("review_score", "desc");
                break;
            default:
                if(!empty($request['order']) and !empty($request['order_by'])){
                    $model_hotel->orderBy("bravo_hotels.".$request['order'], $request['order_by']);
                }else{
                    $model_hotel->orderBy("is_featured", "desc");
                    $model_hotel->orderBy("id", "desc");
                }
        }

        $model_hotel->groupBy("bravo_hotels.id");

        return $model_hotel->with(['location','hasWishList','translation','termsByAttributeInListingPage']);
    }

    public function dataForApi($forSingle = false){
        $data = parent::dataForApi($forSingle);
        if($forSingle){
            $data['review_score'] = $this->getReviewDataAttribute();
            $data['review_stats'] = $this->getReviewStats();
            $data['review_lists'] = $this->getReviewList();
            $data['policy'] = $this->policy;
            $data['star_rate'] = $this->star_rate;
            $data['check_in_time'] = $this->check_in_time;
            $data['check_out_time'] = $this->check_out_time;
            $data['allow_full_day'] = $this->allow_full_day;
            $data['booking_fee'] = setting_item_array('hotel_booking_buyer_fees');
            if (!empty($location_id = $this->location_id)) {
                $related =  parent::query()->where('location_id', $location_id)->where("status", "publish")->take(4)->whereNotIn('id', [$this->id])->with(['location','translation','hasWishList'])->get();
                $data['related'] = $related->map(function ($related) {
                        return $related->dataForApi();
                    }) ?? null;
            }
            $data['terms'] = Terms::getTermsByIdForAPI($this->terms->pluck('term_id'));
        }else{
            $data['review_score'] = $this->getScoreReview();
        }
        return $data;
    }

    static public function getClassAvailability()
    {
        return "\Modules\Hotel\Controllers\HotelController";
    }

    static public function getFiltersSearch()
    {
        $min_max_price = self::getMinMaxPrice();
        return [
            [
                "title"    => __("Filter Price"),
                "field"    => "price_range",
                "position" => "1",
                "min_price" => floor ( Currency::convertPrice($min_max_price[0]) ),
                "max_price" => ceil (Currency::convertPrice($min_max_price[1]) ),
            ],
            [
                "title"    => __("Hotel Star"),
                "field"    => "star_rate",
                "position" => "2",
                "min" => "1",
                "max" => "5",
            ],
            [
                "title"    => __("Review Score"),
                "field"    => "review_score",
                "position" => "3",
                "min" => "1",
                "max" => "5",
            ],
            [
                "title"    => __("Attributes"),
                "field"    => "terms",
                "position" => "4",
                "data" => Attributes::getAllAttributesForApi("hotel")
            ]
        ];
    }
    static public function getFormSearch()
    {
        $search_fields = setting_item_array('hotel_search_fields');
        $search_fields = array_values(\Illuminate\Support\Arr::sort($search_fields, function ($value) {
            return $value['position'] ?? 0;
        }));
        foreach ( $search_fields as &$item){
            if($item['field'] == 'attr' and !empty($item['attr']) ){
                $attr = Attributes::find($item['attr']);
                $item['attr_title'] = $attr->translate()->name;
                foreach($attr->terms as $term)
                {
                    $translate = $term->translate();
                    $item['terms'][] =  [
                        'id' => $term->id,
                        'title' => $translate->name,
                    ];
                }
            }
            if($item['field'] == 'guests'){
                $item['field_guests'] = [
                    [
                        'id'=>'room',
                        'title'=>__('Rooms')
                    ],
                    [
                        'id'=>'adults',
                        'title'=>__('Adults')
                    ],
                    [
                        'id'=>'children',
                        'title'=>__('Children')
                    ]
                ];
            }
        }
        return $search_fields;

    }
}
