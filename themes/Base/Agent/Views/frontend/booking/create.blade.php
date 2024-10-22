@extends('layouts.user')
    @push('css')

        {{-- @if(isset($rows) && isset($is_space))
            @endif --}}
            {{-- @if(isset($rows) && isset($is_hotel)) --}}
            <link href="{{ asset('dist/frontend/module/space/css/space.css?_ver='.config('app.asset_version')) }}" rel="stylesheet">
            <link href="{{ asset('dist/frontend/module/hotel/css/hotel.css?_ver='.config('app.asset_version')) }}" rel="stylesheet">
        {{-- @endif --}}
        <link href="{{ asset('dist/frontend/module/car/css/car.css?_ver='.config('app.asset_version')) }}" rel="stylesheet">
        <link href="{{ asset('dist/frontend/module/tour/css/tour.css?_ver='.config('app.asset_version')) }}" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="{{ asset("libs/fotorama/fotorama.css") }}"/>
        <link rel="stylesheet" type="text/css" href="{{ asset("libs/ion_rangeslider/css/ion.rangeSlider.min.css") }}"/>

    @endpush

@section('content')


    <style>
        .bravo_wrap .bravo_user_profile .booking-history-manager {
            padding: 25px 5px;
        }
        .bravo_wrap .bravo_user_profile .user-form-settings {
            padding: 10px 0px;
        }
        .page-template-content .bravo-form-search-all .g-form-control .nav-tabs li a {
            background-color: #1a2b47;
            border-color: #1a2b47;
            border-radius: 3px 3px 0 0;
            color: #fff;
            display: block;
            font-size: 14px;
            margin-right: 1px;
            padding: 7px 25px;
            text-decoration: none;
        }

        .g-form-control .nav-tabs li a {
            background-color: #1a2b47;
            border-color: #1a2b47;
            border-radius: 3px 3px 0 0;
            color: #fff;
            display: block;
            font-size: 14px;
            margin-right: 1px;
            padding: 7px 25px;
            text-decoration: none;
        }
        .g-form-control .nav-tabs li a.active {
            background-color: #5191fa;
            border-color: #5191fa;
        }
        .g-form-control .nav-tabs li a.active {
            background-color: #5192fa;
            border-color: #5192fa;
            color: #fff;
        }
        .bravo_wrap .bravo_form .field-icon {
            font-size: 25px;
            left: 0px;
        }
        .bravo_wrap .bravo_form .form-content {
            padding: 5px 0 5px 30px;
        }
        .bravo_wrap .bravo_form .form-content label {
            font-size: 12px;
        }
        .bravo_wrap .bravo_form .form-content .smart-search {
            font-size: 13px;
        }
        .bravo_wrap .bravo_form .dropdown-toggle::after {
            top: 36px;
        }
        .bravo_wrap .bravo_user_profile {
            padding: 0 20px;
        }
    </style>

    <h2 class="title-bar no-border-bottom">
        {{__("Create Booking")}}
    </h2>

    @include('admin.message')
    <div class="booking-history-manager">

        <div class="tabbable">
            <ul class="nav nav-tabs ht-nav-tabs">
                <li>
                    <a href="#">
                        {{__("Where would you like to go?")}}
                    </a>
                </li>
            </ul>
        </div>

        <div class="page-template-content" style="padding-bottom: 25px;">
            {!! $search_option !!}
        </div>

        @if(isset($rows) && isset($is_hotel))
            <div class="bravo_search_hotel">
                @include('Agent::frontend.Hotel.layouts.search.list-item')
            </div>
        @endif
        @if(isset($rows) && isset($is_space))
            <div class="bravo_search_hotel">
                @include('Agent::frontend.Space.layouts.search.list-item')
            </div>
        @endif
        @if(isset($rows) && isset($is_tour))
            <div class="bravo_search_hotel">
                @include('Agent::frontend.Tour.layouts.search.list-item')
            </div>
        @endif
        @if(isset($rows) && isset($is_car))
            <div class="bravo_search_hotel">
                @include('Agent::frontend.Car.layouts.search.list-item')
            </div>
        @endif
        @if(isset($rows) && isset($is_event))
            <div class="bravo_search_hotel">
                @include('Agent::frontend.Event.layouts.search.list-item')
            </div>
        @endif
        @if(isset($rows) && isset($is_flight))
            <div class="bravo_search_hotel">
                @include('Agent::frontend.Flight.layouts.search.list-item')
            </div>
        @endif




    </div>

@endsection

@push('js')

    <script type="text/javascript" src="{{ asset("libs/ion_rangeslider/js/ion.rangeSlider.min.js") }}"></script>
    <script type="text/javascript" src="{{ asset('js/filter.js?_ver='.config('app.asset_version')) }}"></script>

    @if(isset($rows) && isset($is_hotel))
        <script type="text/javascript" src="{{ asset('module/hotel/js/hotel.js?_ver='.config('app.asset_version')) }}"></script>
    @endif

    @if(isset($rows) && isset($is_space))
        <script type="text/javascript" src="{{ asset('module/space/js/space.js?_ver='.config('app.asset_version')) }}"></script>
    @endif

    @if(isset($rows) && isset($is_tour))
        <script type="text/javascript" src="{{ asset("libs/fotorama/fotorama.js") }}"></script>
        <script type="text/javascript" src="{{ asset("libs/sticky/jquery.sticky.js") }}"></script>
        <script type="text/javascript" src="{{ asset('module/tour/js/tour.js?_ver='.config('app.asset_version')) }}"></script>
    @endif

@endpush

