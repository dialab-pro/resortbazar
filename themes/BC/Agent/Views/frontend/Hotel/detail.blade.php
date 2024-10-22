@extends('layouts.user')

    @push('css')
        <link href="{{ asset('dist/frontend/module/hotel/css/hotel.css?_ver='.config('app.asset_version')) }}" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="{{ asset("libs/ion_rangeslider/css/ion.rangeSlider.min.css") }}"/>
        <link rel="stylesheet" type="text/css" href="{{ asset("libs/fotorama/fotorama.css") }}"/>
    @endpush

@section('content')
    <style>
        .bravo_wrap .bravo_user_profile {
            padding: 0 20px;
        }
    </style>
    <h2 class="title-bar no-border-bottom">
        {{__("Create Booking")}}
    </h2>

    <div class="bravo_detail_hotel">

        <div class="bravo_content">
            <div class="row">

                <div class="col-md-12">
                    @php $review_score = $row->review_data @endphp
                    @include('Agent::frontend.Hotel.layouts.details.hotel-detail')
                </div>

                <div class="col-md-12">
                    @include('Tour::frontend.layouts.details.vendor')
                    @include('Hotel::frontend.layouts.details.hotel-form-enquiry')
                    <div class="g-all-attribute is_pc">
                        @include('Hotel::frontend.layouts.details.hotel-attributes')
                    </div>
                </div>

            </div>
        </div>

        @include('Hotel::frontend.layouts.details.hotel-form-enquiry-mobile')

    </div>

@endsection

@push('js')
    {!! App\Helpers\MapEngine::scripts() !!}
    <script>
        jQuery(function ($) {
            @if($row->map_lat && $row->map_lng)
            new BravoMapEngine('map_content', {
                disableScripts: true,
                fitBounds: true,
                center: [{{$row->map_lat}}, {{$row->map_lng}}],
                zoom:{{$row->map_zoom ?? "8"}},
                ready: function (engineMap) {
                    engineMap.addMarker([{{$row->map_lat}}, {{$row->map_lng}}], {
                        icon_options: {
                            iconUrl:"{{get_file_url(setting_item("hotel_icon_marker_map"),'full') ?? url('images/icons/png/pin.png') }}"
                        }
                    });
                }
            });
            @endif
        })
    </script>
    <script>
        var bravo_booking_data = {!! json_encode($booking_data) !!}
        var bravo_booking_i18n = {
			no_date_select:'{{__('Please select Start and End date')}}',
            no_guest_select:'{{__('Please select at least one guest')}}',
            load_dates_url:'{{route('space.vendor.availability.loadDates')}}',
            name_required:'{{ __("Name is Required") }}',
            email_required:'{{ __("Email is Required") }}',
        };
    </script>
    <script type="text/javascript" src="{{ asset("libs/ion_rangeslider/js/ion.rangeSlider.min.js") }}"></script>
    <script type="text/javascript" src="{{ asset("libs/fotorama/fotorama.js") }}"></script>
    <script type="text/javascript" src="{{ asset("libs/sticky/jquery.sticky.js") }}"></script>


    <script type="text/javascript" src="{{ asset('module/agent/js/single-hotel.js?_ver='.config('app.asset_version')) }}"></script>


@endpush
