<div class="hotel_rooms_form">
    <h3 class="heading-section">
        {{ __('Available Rooms') }}
    </h3>

    <style>
        @media(max-width: 766px) {
            .hotel_rooms_form .hotel_list_rooms .room-item .hotel-info .room-meta li .item .field-icon {
                display: flex;
                font-size: 16px;
                height: 24px;
                width: 24px;
            }

            .hotel_rooms_form .hotel_list_rooms .room-item .hotel-info .room-meta li .item span {
                font-size: 5px;
            }
        }
    </style>

    <div class="form-book">

        <div class="start_room_sticky"></div>


        <div class="hotel_list_rooms">
            <input type="hidden" name="hotel_id" id="hotel_id" value="{{ $row->id }}">
            <div class="row">
                <div class="col-md-12">
                    @foreach ($row->rooms as $key => $room)
                        <form class="hotel_room_form" action="#" data-room_id="{{ $room->id }}">
                            <div class="room-item form-search-rooms">

                                <div class="row  form-search-row">

                                    <div class="col-xs-12 col-md-3">
                                        <div class="image">
                                            @if (!empty($room->image_id))
                                                @php $image_url = get_file_url($room->image_id, 'full'); @endphp
                                                <img src="{{ $image_url }}" class="img-responsive"
                                                    alt="{{ $room->title }}">
                                            @else
                                                <i class="fa fa-picture-o"></i>
                                            @endif
                                        </div>
                                    </div>




                                    <div class="col-6 col-md-3">
                                        <div class="hotel-info">

                                            <h3 class="room-name"
                                                onclick="showGallery(event,{{ $room->id }}, {{ $room->gallery }})">
                                                {{ $room->title }}
                                            </h3>
                                            <div class="modal" id="modal_room_{{ $room->id }}" tabindex="-1"
                                                role="dialog">
                                                <div class="modal-dialog modal-lg modal-dialog-centered"
                                                    role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">{{ $room->title }}</h5>
                                                            <span class="c-pointer" data-dismiss="modal"
                                                                aria-label="Close">
                                                                <i class="input-icon field-icon fa">
                                                                    <img src="{{ asset('images/ico_close.svg') }}"
                                                                        alt="close">
                                                                </i>
                                                            </span>
                                                        </div>
                                                        <div class="modal-body">
                                                            @if ($room->gallery)
                                                                @php
                                                                    $child_imgs = explode(',', $room->gallery);
                                                                @endphp
                                                                <div class="fotorama" data-nav="thumbs"
                                                                    data-width="100%" data-auto="false"
                                                                    data-allowfullscreen="true">
                                                                    @foreach ($child_imgs as $item)
                                                                        @php $image_url_c = get_file_url($item, 'full'); @endphp
                                                                        <a href="{{ $image_url_c }}"></a>
                                                                    @endforeach
                                                                </div>
                                                            @endif



                                                            <div class="list-attributes">


                                                                <div class="attribute-item">
                                                                    <h4 class="title">
                                                                        Room Amenities
                                                                    </h4>
                                                                    <ul>
                                                                        @foreach ($room->terms as $term)
                                                                            @php
                                                                                $terms_details = \Modules\Core\Models\Terms::where(
                                                                                    'id',
                                                                                    $term->term_id,
                                                                                )->first();
                                                                            @endphp
                                                                            <li>
                                                                                <i class="input-icon field-icon {{ $terms_details->icon }}"
                                                                                    data-toggle="tooltip"
                                                                                    data-placement="top"
                                                                                    title="{{ $terms_details->name }}"></i>
                                                                                {{ $terms_details->name }}
                                                                            </li>
                                                                        @endforeach
                                                                    </ul>
                                                                </div>


                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <ul class="room-meta">

                                                @if ($room->size)
                                                    <li>
                                                        <div class="item" data-toggle="tooltip" data-placement="top"
                                                            title=""
                                                            data-original-title="{{ __('Room Footage') }}">
                                                            <i
                                                                class="input-icon field-icon icofont-ruler-compass-alt"></i>
                                                            <span>
                                                                {{ $room->size ? size_unit_format($room->size) : '' }}
                                                            </span>
                                                        </div>
                                                    </li>
                                                @endif

                                                @if ($room->beds)
                                                    <li>
                                                        <div class="item" data-toggle="tooltip" data-placement="top"
                                                            title="" data-original-title="{{ __('No. Beds') }}">
                                                            <i class="input-icon field-icon icofont-hotel"></i>
                                                            <span>{{ $room->beds ? 'x' . $room->beds : '' }}</span>
                                                        </div>
                                                    </li>
                                                @endif

                                                @if ($room->adults)
                                                    <li v-if="room.adults_html">
                                                        <div class="item" data-toggle="tooltip" data-placement="top"
                                                            title=""
                                                            data-original-title="{{ __('No. Adults') }}">
                                                            <i class="input-icon field-icon icofont-users-alt-4"></i>
                                                            <span>{{ $room->adults ? 'x' . $room->adults : '' }}</span>
                                                        </div>
                                                    </li>
                                                @endif

                                                @if ($room->children)
                                                    <li v-if="room.children_html">
                                                        <div class="item" data-toggle="tooltip" data-placement="top"
                                                            title=""
                                                            data-original-title="{{ __('No. Children') }}">
                                                            <i class="input-icon field-icon fa-child fa"></i>
                                                            <span>{{ $room->children ? 'x' . $room->children : '' }}</span>
                                                        </div>
                                                    </li>
                                                @endif

                                            </ul>
                                            {{-- @if ($room->children)
                                                terms
                                                <div class="room-attribute-item" v-if="room.term_features">
                                                    <ul>
                                                        <li v-for="term_child in room.term_features">
                                                            <i class="input-icon field-icon" v-bind:class="term_child.icon" data-toggle="tooltip" data-placement="top" :title="term_child.title"></i>
                                                        </li>
                                                    </ul>
                                                </div>
                                            @endif --}}
                                        </div>
                                    </div>

                                    <div class="col-6 col-md-2">
                                        <div class="form-group form-date-field checkAbilityDatepicker">
                                            <input type="hidden" class="ids" value="{{ $room->id }}"
                                                data-hotel_id="{{ $row->id }}">
                                            <i class="fa fa-angle-down arrow"></i>
                                            <input type="text" class="start_date" ref="start_date"
                                                style="height: 1px; visibility: hidden">
                                            <div class="date-wrapper form-content">

                                                <label class="form-label">
                                                    {{ __('Check In - Out') }}
                                                </label>
                                                <div class="render check-in-render">
                                                    {{ Request::query('start', display_date(strtotime('today'))) }}
                                                </div>
                                                -
                                                <div class="render check-out-render">
                                                    {{ Request::query('end', display_date(strtotime('+1 day'))) }}
                                                </div>
                                            </div>
                                            <input type="hidden" class="check-in-input"
                                                value="{{ Request::query('start', display_date(strtotime('today'))) }}"
                                                name="start">
                                            <input type="hidden" class="check-out-input"
                                                value="{{ Request::query('end', display_date(strtotime('+1 day'))) }}"
                                                name="end">
                                            <input
                                                style="bottom: 1px;left: -15px;opacity: 0;position: absolute;z-index: -1;"
                                                type="text" class="check-in-out"
                                                value="{{ Request::query('date', date('Y-m-d') . ' - ' . date('Y-m-d', strtotime('+1 day'))) }}">
                                        </div>
                                    </div>


                                    <div class="col-md-4 form_for_guest_adult_child"
                                        style="display: flex;justify-content: space-between;">
                                        <div class="form-group">
                                            <i class="fa fa-angle-down arrow" style="right: 0px;"></i>

                                            <div class="form-content dropdown-toggle" data-toggle="dropdown">
                                                <label class="form-label">Guests</label>
                                                <div class="render">
                                                    <span class="adults">
                                                        <span class="one">1</span>
                                                        <span class="type">Adult</span>
                                                    </span>
                                                    -
                                                    <span class="children">
                                                        <span class="one">0</span>
                                                        <span class="type">Child</span>
                                                    </span>
                                                </div>
                                            </div>

                                            <div class="dropdown-menu select-guests-dropdown" style="width: 150%">
                                                <div class="dropdown-item-row">
                                                    <div class="label">
                                                        Adults
                                                    </div>
                                                    <div class="val">
                                                        <span class="btn-minus2" data-input="adults">
                                                            <i class="icon ion-md-remove"></i>
                                                        </span>
                                                        <span class="count-display">
                                                            <input type="number" class="adultsInput" value="1"
                                                                min="1" />
                                                        </span>
                                                        <span class="btn-add2" data-input="adults">
                                                            <i class="icon ion-ios-add"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="dropdown-item-row">
                                                    <div class="label">Children</div>
                                                    <div class="val">
                                                        <span class="btn-minus2" data-input="children">
                                                            <i class="icon ion-md-remove"></i>
                                                        </span>
                                                        <span class="count-display">
                                                            <input type="number" class="childrenInput"
                                                                value="0" min="0" />
                                                        </span>
                                                        <span class="btn-add2" data-input="children">
                                                            <i class="icon ion-ios-add"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="col-price clear" style="padding: 15px 5px;">

                                            <div class="text-center priceField">
                                                @php

                                                    $hotel = $room->hotel;
                                                    // $start_date = \Carbon\Carbon::parse(
                                                    //     Request::query('start', display_date(strtotime('today'))),
                                                    // );
                                                    $start_date = \Carbon\Carbon::today();

                                                    // $end_date = \Carbon\Carbon::parse(
                                                    //     Request::query('end', display_date(strtotime('+1 day'))),
                                                    // );
                                                    $end_date = $start_date->copy()->addDay();
                                                    $discount_start_date =
                                                        \Carbon\Carbon::parse(
                                                            $hotel->discount_start_date,
                                                        )->startOfDay() ?? null;
                                                    $discount_end_date =
                                                        \Carbon\Carbon::parse(
                                                            $hotel->discount_end_date,
                                                        )->startOfDay() ?? null;

                                                    $discount_type = $hotel->discount_type;
                                                    $discount_amount = $hotel->discount_amount;
                                                    $total_discount_amount = 0;
                                                    $after_discount_amount = 0;
                                                    if ($discount_type == 'flat') {
                                                        $total_discount_amount = $discount_amount;
                                                        $after_discount_amount =
                                                            (float) $room->price - (float) $total_discount_amount;
                                                    } else {
                                                        $total_discount_amount =
                                                            ((float) $room->price * (float) $discount_amount) / 100;
                                                        $after_discount_amount =
                                                            (float) $room->price - (float) $total_discount_amount;
                                                    }

                                                    // dd($after_discount_amount, $total_discount_amount);

                                                @endphp


                                                <span class="price">
                                                    @if ($hotel->discount_amount > 0)
                                                        @if ($start_date->between($discount_start_date, $discount_end_date))
                                                            {!! '<del>' .
                                                                format_money($room->price) .
                                                                '</del> ' .
                                                                format_money($after_discount_amount) .
                                                                '<span class="unit">/' .
                                                                ($room->min_day_stays
                                                                    ? __(':count nights', ['count' => $room->min_day_stays])
                                                                    : __(':count night', ['count' => $room->min_day_stays])) .
                                                                '</span>' !!}
                                                            <p class="showDiscountAmount">
                                                                {{ $hotel->discount_type == 'flat' ? $hotel->discount_amount . ' taka off' : $hotel->discount_amount . '% off' }}
                                                            </p>
                                                        @else
                                                            {!! format_money($room->price) .
                                                                '<span class="unit">/' .
                                                                ($room->min_day_stays
                                                                    ? __(':count nights', ['count' => $room->min_day_stays])
                                                                    : __(':count night', ['count' => $room->min_day_stays])) .
                                                                '</span>' !!}
                                                        @endif
                                                    @else
                                                        {!! format_money($room->price) .
                                                            '<span class="unit">/' .
                                                            ($room->min_day_stays
                                                                ? __(':count nights', ['count' => $room->min_day_stays])
                                                                : __(':count night', ['count' => $room->min_day_stays])) .
                                                            '</span>' !!}
                                                    @endif


                                                </span>
                                            </div>

                                            <select class="custom-select d-none">
                                            </select>

                                        </div>
                                    </div>


                                </div>


                                @if ($room->enable_extra_price)
                                    <div class="row">
                                        <div class="col-md-3 col-0"></div>
                                        <div class="col-xs-12 col-md-9">
                                            <hr style="margin: 2px 0;">
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <div style="float: left;margin-right: 10px;">
                                                        <label>{{ __('Extra prices:') }}</label>
                                                    </div>
                                                </div>

                                                <div class="col-md-10">
                                                    <div class="extra-price-wrap d-flex justify-content-between">
                                                        @foreach ($room->extra_price as $extra_price)
                                                            <div
                                                                class="flex-grow-1 d-flex justify-content-lg-start room_extra_price">
                                                                <label style="margin-right: 5px;">
                                                                    <input class="extra_price_item_check"
                                                                        type="checkbox">
                                                                    <input type="hidden" class="extra_price_type"
                                                                        name="extra_price_type"
                                                                        value="{{ $extra_price['type'] }}">
                                                                    <input type="hidden" class="extra_price"
                                                                        name="extra_price"
                                                                        value="{{ $extra_price['price'] }}">
                                                                    <input type="hidden" class="extra_price_name"
                                                                        name="extra_price_name"
                                                                        value="{{ $extra_price['name'] }}">

                                                                    @if (isset($extra_price['per_person']))
                                                                        <input type="hidden" class="per_person"
                                                                            name="per_person" value="on">
                                                                    @else
                                                                        <input type="hidden" class="per_person"
                                                                            name="per_person" value="off">
                                                                    @endif

                                                                    {{ $extra_price['name'] }}

                                                                    <div class="render"
                                                                        style="color: #464646;display: inline-block;font-size: 12px;">
                                                                        (@if ($extra_price['type'] == 'per_day')
                                                                            /day
                                                                        @endif
                                                                        @if (isset($extra_price['per_person']))
                                                                            @if ($extra_price['per_person'] == 'on')
                                                                                /guest
                                                                            @endif
                                                                        @endif)
                                                                    </div>
                                                                </label>
                                                                <div class="flex-shrink-0">
                                                                    {!! format_money($extra_price['price']) !!}
                                                                </div>
                                                            </div>
                                                        @endforeach
                                                    </div>
                                                </div>

                                            </div>

                                        </div>
                                    </div>
                                @endif

                                @if ($room->enable_service_fee)
                                    <div class="row">
                                        <div class="col-md-3 col-0"></div>
                                        <div class="col-xs-12 col-md-9">

                                            <div class="row">
                                                <div class="col-md-2">
                                                    <div style="float: left;margin-right: 10px;">
                                                        <label>{{ __('Service fee:') }}</label>
                                                    </div>
                                                </div>

                                                <div class="col-md-10">
                                                    <div class="extra-price-wrap d-flex justify-content-between">
                                                        @foreach ($room->service_fee as $service_fee)
                                                            <div
                                                                class="flex-grow-1 d-flex justify-content-lg-start room_service_fee">
                                                                <label style="margin-right: 5px;">

                                                                    <input class="service_fee_item_check"
                                                                        type="hidden" value="1">

                                                                    <input type="hidden" class="service_fee_type"
                                                                        name="service_fee_type"
                                                                        value="{{ $service_fee['unit'] }}">
                                                                    <input type="hidden" class="service_fee_name"
                                                                        name="service_fee_name"
                                                                        value="{{ $service_fee['name'] }}">
                                                                    <input type="hidden" class="service_fee"
                                                                        name="service_fee"
                                                                        value="{{ $service_fee['price'] }}">
                                                                    @if (isset($service_fee['per_person']))
                                                                        <input type="hidden"
                                                                            class="service_fee_per_person"
                                                                            name="service_fee_per_person"
                                                                            value="on">
                                                                    @else
                                                                        <input type="hidden"
                                                                            class="service_fee_per_person"
                                                                            name="service_fee_per_person"
                                                                            value="off">
                                                                    @endif
                                                                    {{ $service_fee['name'] }}
                                                                    <span class="render">
                                                                        (@if (isset($service_fee['per_person']))
                                                                            @if ($service_fee['per_person'] == 'on')
                                                                                /guest
                                                                            @endif
                                                                        @endif)
                                                                    </span>
                                                                </label>
                                                                <div class="flex-shrink-0">
                                                                    @if ($service_fee['unit'] == 'fixed')
                                                                        <div class="unit">
                                                                            {!! format_money($service_fee['price']) !!}
                                                                        </div>
                                                                    @else
                                                                        <div class="unit">
                                                                            {!! format_money($service_fee['price']) !!}%
                                                                        </div>
                                                                    @endif
                                                                </div>
                                                            </div>
                                                        @endforeach
                                                    </div>
                                                </div>

                                            </div>

                                        </div>
                                    </div>
                                @endif

                            </div>
                        </form>
                    @endforeach

                </div>
            </div>
        </div>


        <style>
            .hotel_rooms_form .hotel_room_book_status.sticky.minimized {
                /* width: 50px; */
                /* height: 40px; */
                overflow: hidden;
            }

            #selected_rooms_form {
                margin-top: 15px !important;
            }

            .minimize-button {
                cursor: pointer !important;
                padding: 1px 10px;
                background-color: transparent;
                border: none;
                border-radius: 3px;
                position: absolute;
                top: 5px;
                right: 1px;
                z-index: 111;
                line-height: 1;
                font-size: 18px;
            }

            .minimize-button:focus {
                outline: 0;
                border: 0;
                border-color: none;
            }

            .row_selected_rooms_form.hidden {
                transition: all .3s;
                height: 0;
                opacity: 0;
                visibility: hidden;
            }
        </style>


        <div class="hotel_room_book_status d-none" id="hotelRoomBookStatus">

            <button class="minimize-button" id="minimizeButton">
                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
            </button>

            <form action="#" class="selected_rooms_form" id="selected_rooms_form">

                <div class="row row_selected_rooms_form" style="margin-top: 15px;" id="rowSelectedRoomsForm">
                    <div class="col-md-12">
                        <div class="form-section-group">
                            <label>
                                {{ __('Selected Rooms:') }}
                            </label>

                            <div class="row">
                                <div class="col-md-12 room-item">

                                    <div id="room_list_heading">
                                        <div class="extra-price-wrap d-flex justify-content-between">

                                            <div class="flex-grow-1" style="font-weight: 700;width:30%;">
                                                Rooms
                                            </div>

                                            <div class="flex-grow-1 text-center" style="font-weight: 700;width:10%;">
                                                Price
                                            </div>

                                            <div class="flex-grow-1 text-center" style="font-weight: 700;width:10%;">
                                                Total Room
                                            </div>

                                            <div class="flex-grow-1 text-center" style="font-weight: 700;width:10%;">
                                                Extra price
                                            </div>

                                            <div class="flex-grow-1 text-center" style="font-weight: 700;width:10%;">
                                                Service free
                                            </div>

                                            <div class="flex-grow-1 text-center" style="font-weight: 700;width:10%;">
                                                Subtotal
                                            </div>

                                            <div class="flex-grow-1" style="text-align: end;width:10%;">
                                                <span class="btn btn-danger btn-sm btn-remove-item">
                                                    <i class="fa fa-trash"></i>
                                                </span>
                                            </div>

                                        </div>
                                    </div>


                                    <!--  -->
                                    <div class="rooms_row">



                                    </div>
                                    <!--  -->



                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </form>

            <hr>
            <form action="#" class="total_price_form">

                <div class="row row_total_price">
                    <div class="col-md-6">
                        <div class="extra-price-wrap d-flex justify-content-between">
                            <div class="flex-grow-1">
                                <label>
                                    {{ __('Total Room') }}:
                                </label>
                            </div>
                            <div class="flex-shrink-0 total_rooms"></div>
                        </div>

                        <div class="extra-price-wrap d-flex justify-content-between is_mobile">
                            <div class="flex-grow-1">
                                <label>
                                    {{ __('Total Price') }}:
                                </label>
                            </div>
                            <div class="total-room-price total_price_html"></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="control-book">

                            <div class="total-room-price">
                                <span> {{ __('Total Price') }}:</span>
                                <span class="total_price_html"></span>
                            </div>
                            <button type="button" id="submit_booking" class="btn btn-primary">
                                <span>
                                    {{ __('Book Now') }}
                                </span>
                            </button>
                        </div>

                    </div>
                </div>

            </form>

        </div>


        <div class="end_room_sticky"></div>

        @if (count($row->rooms) < 1)
            <div class="alert alert-warning" v-if="!firstLoad && !rooms.length">
                {{ __('No room available with your selected date. Please change your search critical') }}
            </div>
        @endif

    </div>

</div>

@include('Booking::frontend.global.enquiry-form', ['service_type' => 'hotel'])
