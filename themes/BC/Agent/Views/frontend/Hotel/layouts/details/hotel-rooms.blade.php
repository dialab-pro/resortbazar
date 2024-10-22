<div class="hotel_rooms_form">

    <h3 class="heading-section">
        {{ __('Available Rooms') }}
    </h3>

    <div class="form-book">

        <div class="start_room_sticky"></div>


        <div class="hotel_list_rooms">
            <input type="hidden" name="hotel_id" id="hotel_id" value="{{ $row->id }}">
            <div class="row">
                <div class="col-md-12">
                    @foreach ($row->rooms as $room)
                        <form class="hotel_room_form" action="#">
                            <div class="room-item">
                                <div class="row">
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


                                    <div class="col-xs-12 col-md-3">
                                        <div class="hotel-info">

                                            <h3 class="room-name">
                                                {{ $room->title }}
                                            </h3>

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
                                                            title="" data-original-title="{{ __('No. Adults') }}">
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


                                    <div class="col-xs-12 col-md-6">
                                        <div class="row">

                                            <div class="col-md-8 form-search-rooms"
                                                style="border: 0;margin: 0;padding-top: 20px;">
                                                <div class="d-flex form-search-row">

                                                    <div class="col-md-6" style="padding: 0;">
                                                        <div class="form-group form-date-field checkAbilityDatepicker">

                                                            <input type="hidden" class="ids"
                                                                value="{{ $room->id }}"
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

                                                    <div class="col-md-6 form_for_guest_adult_child"
                                                        style="padding: 0;">
                                                        <div class="form-group">
                                                            <i class="fa fa-angle-down arrow"></i>

                                                            <div class="form-content dropdown-toggle"
                                                                data-toggle="dropdown">
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

                                                            <div class="dropdown-menu select-guests-dropdown">
                                                                <div class="dropdown-item-row">
                                                                    <div class="label">
                                                                        Adults
                                                                    </div>
                                                                    <div class="val">
                                                                        <span class="btn-minus2" data-input="adults">
                                                                            <i class="icon ion-md-remove"></i>
                                                                        </span>
                                                                        <span class="count-display">
                                                                            <input type="number" class="adultsInput"
                                                                                value="1" min="1" />
                                                                        </span>
                                                                        <span class="btn-add2" data-input="adults">
                                                                            <i class="icon ion-ios-add"></i>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                <div class="dropdown-item-row">
                                                                    <div class="label">Children</div>
                                                                    <div class="val">
                                                                        <span class="btn-minus2"
                                                                            data-input="children">
                                                                            <i class="icon ion-md-remove"></i>
                                                                        </span>
                                                                        <span class="count-display">
                                                                            <input type="number"
                                                                                class="childrenInput" value="0"
                                                                                min="0" />
                                                                        </span>
                                                                        <span class="btn-add2" data-input="children">
                                                                            <i class="icon ion-ios-add"></i>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>

                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div>
                                                    <div class="col-price clear">

                                                        <div class="text-center">
                                                            <span class="price">
                                                                {!! format_money($room->price) .
                                                                    '<span class="unit">/' .
                                                                    ($room->min_day_stays
                                                                        ? __(':count nights', ['count' => $room->min_day_stays])
                                                                        : __(':count night', ['count' => $room->min_day_stays])) .
                                                                    '</span>' !!}
                                                            </span>
                                                        </div>

                                                        <select class="custom-select d-none">
                                                        </select>

                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                    </div>

                                </div>
                            </div>
                        </form>
                    @endforeach

                </div>
            </div>
        </div>

        <div class="hotel_room_book_status d-none">

            <form action="#" class="extra_price_form">
                @if ($row->enable_extra_price)
                    <div class="row row_extra_service">
                        <div class="col-md-12">
                            <div class="form-section-group">
                                <label>{{ __('Extra prices:') }}</label>
                                <div class="row">

                                    @foreach ($row->extra_price as $extra_price)
                                        <div class="col-md-6 extra-item">
                                            <div class="extra-price-wrap d-flex justify-content-between">
                                                <div class="flex-grow-1">
                                                    <label>

                                                        <input class="extra_price_item_check" type="checkbox">
                                                        <input type="hidden" class="extra_price_type"
                                                            name="extra_price_type"
                                                            value="{{ $extra_price['type'] }}">
                                                        <input type="hidden" class="extra_price" name="extra_price"
                                                            value="{{ $extra_price['price'] }}">

                                                        @if (isset($extra_price['per_person']))
                                                            <input type="hidden" class="per_person"
                                                                name="per_person" value="on">
                                                        @else
                                                            <input type="hidden" class="per_person"
                                                                name="per_person" value="off">
                                                        @endif

                                                        {{ $extra_price['name'] }}

                                                        <div class="render">
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
                                                </div>

                                                <div class="flex-shrink-0">
                                                    {!! format_money($extra_price['price']) !!}
                                                </div>

                                            </div>
                                        </div>
                                    @endforeach

                                </div>
                            </div>
                        </div>
                    </div>
                @endif
            </form>

            <form action="#" class="service_fee_form">
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


                        @if ($row->enable_service_fee)
                            @foreach ($row->service_fee as $service_fee)
                                <div class="enable_service_fee extra-price-wrap d-flex justify-content-between">
                                    <div class="flex-grow-1">
                                        <label>

                                            <input type="hidden" class="service_fee_type" name="service_fee_type"
                                                value="{{ $service_fee['unit'] }}">
                                            <input type="hidden" class="service_fee" name="service_fee"
                                                value="{{ $service_fee['price'] }}">


                                            @if (isset($service_fee['per_person']))
                                                <input type="hidden" class="service_fee_per_person"
                                                    name="service_fee_per_person" value="on">
                                            @else
                                                <input type="hidden" class="service_fee_per_person"
                                                    name="service_fee_per_person" value="off">
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
                                    </div>
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
                        @endif



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
