<?php
$translation = $service->translate();
$lang_local = app()->getLocale();
?>
<div class="b-panel-title">{{__('Hotel information')}}</div>
<div class="b-table-wrap">
    <table class="b-table" cellspacing="0" cellpadding="0">
        <tr>
            <td class="label">{{__('Booking Number')}}</td>
            <td class="val">#{{$booking->id}}</td>
        </tr>
        <tr>
            <td class="label">{{__('Booking Status')}}</td>
            <td class="val">{{$booking->statusName}}</td>
        </tr>
        @if($booking->gatewayObj)
            <tr>
                <td class="label">{{__('Payment method')}}</td>
                <td class="val">{{$booking->gatewayObj->getOption('name')}}</td>
            </tr>
        @endif
        @if($booking->gatewayObj and $note = $booking->gatewayObj->getOption('payment_note'))
            <tr>
                <td class="label">{{__('Payment Note')}}</td>
                <td class="val">{!! clean($note) !!}</td>
            </tr>
        @endif
        <tr>
            <td class="label">{{__('Hotel name')}}</td>
            <td class="val">
                <a href="{{$service->getDetailUrl()}}">{!! clean($translation->title) !!}</a>
            </td>
        </tr>
        <tr>
            @if($translation->address)
                <td class="label">{{__('Address')}}</td>
                <td class="val">
                    {{$translation->address}}
                </td>
            @endif
        </tr>
        @if($booking->start_date && $booking->end_date)
            <tr>
                <td class="label">{{__('Check in')}}</td>
                <td class="val">{{display_date($booking->start_date)}}</td>
            </tr>
            <tr>
                <td class="label">{{__('Check out:')}}</td>
                <td class="val">
                    {{display_date($booking->end_date)}}
                </td>
            </tr>
            <tr>
                <td class="label">{{__('Nights:')}}</td>
                <td class="val">
                    {{$booking->duration_nights}}
                </td>
            </tr>
        @endif

        @if($meta = $booking->getMeta('adults'))
            <tr>
                <td class="label">{{__('Adults')}}:</td>
                <td class="val">
                    <strong>{{$meta}}</strong>
                </td>
            </tr>
        @endif
        @if($meta = $booking->getMeta('children'))
            <tr>
                <td class="label">{{__('Children')}}:</td>
                <td class="val">
                    <strong>{{$meta}}</strong>
                </td>
            </tr>
        @endif
        <tr>
            <td class="label">{{__('Pricing')}}</td>
            <td class="val">
                <table class="pricing-list" width="100%">
                    @php $rooms = \Modules\Hotel\Models\HotelRoomBooking::getByBookingId($booking->id) @endphp
                    @if(!empty($rooms))
                        @foreach($rooms as $key => $room)
                            <tr @if ($key >0) style="border-top: 1px solid #000" @endif >
                                <td class="label">{{$room->room->title}} * {{$room->number}}
                                    :</td>
                                <td class="val no-r-padding">
                                    <strong>{{format_money($room->price * $room->number)}}</strong>
                                </td>
                            </tr>

                            @if(!empty($room->extra_prices))

                                <tr>
                                    <td class="label" style="font-weight: 800;">
                                        {{__('Extra price:')}} :
                                    </td>
                                    <td class="val no-r-padding">&nbsp;</td>
                                </tr>
                                @php
                                    $extra_ps = [];
                                    if (is_string($room->extra_prices)) {
                                        $extra_ps = json_decode($room->extra_prices, true);
                                    }else{
                                        if(!empty($room->extra_prices)){
                                            $extra_ps = $room->extra_prices;
                                        }
                                    }
                                @endphp

                                @foreach($extra_ps as $extra_p)
                                    <tr>
                                        <td class="label">
                                            {{$extra_p['extra_price_name']}}
                                            (@if ($extra_p['type'] == "per_day")
                                                /day
                                            @endif
                                            @if (isset($extra_p['per_person']))
                                                @if ($extra_p['per_person'] == "on")
                                                    /guest
                                                @endif
                                            @endif)
                                        </td>
                                        <td class="val no-r-padding">{{format_money($extra_p['price'])}}</td>
                                    </tr>
                                @endforeach

                            @endif


                            @if(!empty($room->vendor_service_fee))

                                <tr>
                                    <td class="label" style="font-weight: 800;">
                                        {{__('Service fee:')}} :
                                    </td>
                                    <td class="val no-r-padding">&nbsp;</td>
                                </tr>

                                @php
                                    $extra_ps = [];
                                    if (is_string($room->vendor_service_fee)) {
                                        $vendor_service_fee_ps = json_decode($room->vendor_service_fee, true);
                                    }else{
                                        if(!empty($room->vendor_service_fee)){
                                            $vendor_service_fee_ps = $room->vendor_service_fee;
                                        }
                                    }
                                @endphp

                                @foreach($vendor_service_fee_ps as $fee_ps)

                                    <tr>
                                        <td class="label">
                                            {{$fee_ps['service_name']}}
                                            (@if (isset($fee_ps['per_person']))
                                                @if ($fee_ps['per_person'] == "on")
                                                    /guest
                                                @endif
                                            @endif)
                                        </td>
                                        <td class="val no-r-padding">{{format_money($fee_ps['price'])}}</td>
                                    </tr>

                                @endforeach

                            @endif

                        @endforeach
                    @endif




                    @php
                        $list_all_fee = [];
                        if(!empty($booking->buyer_fees)){
                            $buyer_fees = json_decode($booking->buyer_fees , true);
                            $list_all_fee = $buyer_fees;
                        }
                    @endphp
                    @if(!empty($list_all_fee))
                        @foreach ($list_all_fee as $item)
                            @php
                                $fee_price = $item['price'];
                                if(!empty($item['unit']) and $item['unit'] == "percent"){
                                    $fee_price = ( $booking->total_before_fees / 100 ) * $item['price'];
                                }
                            @endphp
                            <tr>
                                <td class="label">
                                    {{$item['name_'.$lang_local] ?? $item['name']}}
                                    <i class="icofont-info-circle" data-toggle="tooltip" data-placement="top" title="{{ $item['desc_'.$lang_local] ?? $item['desc'] }}"></i>
                                    @if(!empty($item['per_person']) and $item['per_person'] == "on")
                                        : {{$booking->total_guests}} * {{format_money( $fee_price )}}
                                    @endif
                                </td>
                                <td class="val">
                                    @if(!empty($item['per_person']) and $item['per_person'] == "on")
                                        {{ format_money( $fee_price * $booking->total_guests ) }}
                                    @else
                                        {{ format_money( $fee_price ) }}
                                    @endif
                                </td>
                            </tr>
                        @endforeach
                    @endif
                    @if(!empty($booking->coupon_amount) and $booking->coupon_amount > 0)
                        <tr>
                            <td class="label">
                                {{__("Coupon")}}
                            </td>
                            <td class="val">
                                -{{ format_money($booking->coupon_amount) }}
                            </td>
                        </tr>
                    @endif
                </table>
            </td>
        </tr>
        <tr>
            <td class="label fsz21">{{__('Total')}}</td>
            <td class="val fsz21"><strong style="color: #FA5636">{{format_money($booking->total)}}</strong></td>
        </tr>
        <tr>
            <td class="label fsz21">{{__('Paid')}}</td>
            <td class="val fsz21"><strong style="color: #FA5636">{{format_money($booking->paid)}}</strong></td>
        </tr>
        @if($booking->total > $booking->paid)
            <tr>
                <td class="label fsz21">{{__('Remain')}}</td>
                <td class="val fsz21"><strong style="color: #FA5636">{{format_money($booking->total - $booking->paid)}}</strong></td>
            </tr>
        @endif
    </table>
</div>
<div class="text-center mt20">
    <a href="{{ route("user.booking_history") }}" target="_blank" class="btn btn-primary manage-booking-btn">{{__('Manage Bookings')}}</a>
</div>
