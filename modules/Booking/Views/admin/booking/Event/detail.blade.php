@extends('layouts.user')
@push('css')
    <link href="{{ asset('dist/frontend/module/event/css/event.css?_ver='.config('app.asset_version')) }}" rel="stylesheet">
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

    <div class="bravo_detail_event">
        <div class="bravo_content">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-lg-9">
                        @php $review_score = $row->review_data @endphp
                        @include('Event::frontend.layouts.details.detail')
                    </div>
                    <div class="col-md-12 col-lg-3">
                        @include('Tour::frontend.layouts.details.vendor')
                        @include('Event::frontend.layouts.details.form-book')
                    </div>
                </div>

            </div>
        </div>
        @include('Event::frontend.layouts.details.form-book-mobile')
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
                            iconUrl:"{{get_file_url(setting_item("event_icon_marker_map"),'full') ?? url('images/icons/png/pin.png') }}"
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
            no_guest_select:'{{__('Please select at least one number')}}',
            load_dates_url:'{{route('event.vendor.availability.loadDates')}}'
        };
    </script>
    <script type="text/javascript" src="{{ asset("libs/ion_rangeslider/js/ion.rangeSlider.min.js") }}"></script>
    <script type="text/javascript" src="{{ asset("libs/fotorama/fotorama.js") }}"></script>
    <script type="text/javascript" src="{{ asset("libs/sticky/jquery.sticky.js") }}"></script>

    <script type="text/javascript" src="{{ asset('module/agent/js/single-event.js?_ver='.config('app.asset_version')) }}"></script>
@endpush
