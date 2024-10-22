@extends('layouts.app')
@section('content')
    <style>
        .hero h1 {
            background-color: rgba(0, 0, 0, 0.5);
            padding: 20px;
            border-radius: 8px;
        }

        .card-img-overlay {
            background: rgba(0, 0, 0, 0.5);
        }

        .card {
            position: relative;
            overflow: hidden;
        }

        .overlay-content {
            opacity: 0;
            transition: opacity 0.3s ease-in-out;
            background-color: rgba(0, 0, 0, 0.6);
            text-align: center;
            padding: 20px;
        }

        .card:hover .overlay-content {
            opacity: 1;
        }


        /* for package card */
        .card-img-top {
            height: 200px;
            object-fit: cover;
        }

        .badge-top-left {
            position: absolute;
            top: 10px;
            left: 10px;
            background-color: #e3f2fd;
            color: #007bff;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 0.875rem;
        }

        .card-title {
            font-size: 1.5rem;
            font-weight: bold;
        }

        .price {
            font-size: 1.5rem;
            font-weight: bold;
            color: #007bff;
        }

        .rating {
            color: #ffc107;
            margin-right: 5px;
        }

        .review-count {
            color: #888;
            font-size: 0.9rem;
        }

        .feature {
            font-size: 0.9rem;
            color: #777;
        }

        .checkAvailityButton {
            border: 1px solid black;
            border-radius: 50px;
            background-color: white;
            /* Assuming a default background color */
            color: black;
            /* Assuming a default text color */
            transition: background-color 0.3s, color 0.3s;
            /* Adjust the duration as needed */
        }

        .checkAvailityButton:hover {
            background-color: black;
            color: white;
        }

        /* style of owl carosusel */
        /* Custom Arrow Styles */
        .owl-theme .owl-nav [class*='owl-'] {
            background: #333;
            /* Background color for the arrows */
            color: #fff;
            /* Arrow color */
            font-size: 18px;
            /* Size of the arrows */
            border-radius: 50%;
            /* Make the arrows circular */
            padding: 10px 15px;
            /* Padding around the arrows */
            margin: 5px;
            /* Margin around the arrows */
            transition: background 0.3s ease;
            /* Smooth transition effect */
        }

        .owl-theme .owl-nav [class*='owl-']:hover {
            background: #555;
            /* Background color on hover */
            color: #fff;
            /* Arrow color on hover */
        }

        /* Positioning the arrows */
        .owl-theme .owl-nav .owl-prev {
            position: absolute;
            left: -25px;
            /* Position left arrow */
            top: 50%;
            transform: translateY(-50%);
        }

        .owl-theme .owl-nav .owl-next {
            position: absolute;
            right: -25px;
            /* Position right arrow */
            top: 50%;
            transform: translateY(-50%);
        }

        /* Centering the Dots */
        .owl-theme .owl-dots {
            text-align: center;
            /* Center the dots horizontally */
            margin-top: 15px;
            /* Add some space above the dots */
        }

        /* Custom Dot Styles */
        .owl-theme .owl-dots .owl-dot {
            width: 12px;
            /* Width of the dots */
            height: 12px;
            /* Height of the dots */
            background: #ccc;
            /* Default background color */
            border-radius: 50%;
            /* Make dots circular */
            display: inline-block;
            /* Inline block for proper spacing */
            margin: 5px;
            /* Space between dots */
            transition: background 0.3s ease;
            /* Smooth transition effect */
            border: 2px solid transparent;
            /* Border for better appearance */
        }

        .owl-theme .owl-dots .owl-dot.active {
            background: #333;
            /* Background color for active dot */
            border-color: #333;
            /* Border color for active dot */
        }

        .owl-theme .owl-dots .owl-dot:hover {
            background: #555;
            /* Background color on hover */
        }
    </style>
    <div class="hero"
        style="background-image: url('{{ asset($boatDestination->banner_image ?? '') }}'); background-size: cover; background-position: center; height: 400px; color: white; display: flex; align-items: center; justify-content: center;">
        <h1>{{ $boatDestination->title ?? 'Location Name' }}</h1>
    </div>
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-12">
                <h2>About the Location</h2>
                <hr>
                {!! $boatDestination->long_description !!}
            </div>
        </div>
    </div>

    <!-- Boat Listings -->
    <div class="container mt-5">
        <h2 class="mb-4">Available Boats</h2>
        <div class="row g-4">
            @if ($boatDestination->boat)
                <div class="owl-carousel owl-theme">
                    @foreach ($boatDestination->boat as $key => $boat)
                        <!-- Card 1 -->
                        <div class="">
                            <div class="card text-white">
                                @php
                                    $images = json_decode($boat->image);
                                @endphp
                                <img src="{{ asset($images[0]) ?? 'https://loremflickr.com/200/200?random=1' }}"
                                    class="card-img" alt="{{ $boat->title ?? 'Boat Image' }}">
                                <div
                                    class="card-img-overlay d-flex flex-column justify-content-center align-items-center overlay-content">
                                    <h5 class="card-title">{{ $boat->title ?? 'Boat Name' }}</h5>
                                    <p class="card-text">
                                        {{ \Illuminate\Support\Str::limit($boat->short_description ?? 'N/A', 50, '...') }}
                                    </p>
                                    <a href="{{ route('boat.front.boatDetails', $boat->slug) }}" class="btn btn-dark">View
                                        Boat</a>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            @endif
        </div>
    </div>

@endsection

@push('js')
    <script>
        $(document).ready(function() {
            $(".owl-carousel").owlCarousel({
                loop: true,
                margin: 10,
                nav: true,
                dots: true,
                autoplay: true,
                autoplayTimeout: 3000,
                autoplayHoverPause: true,
                responsive: {
                    0: {
                        items: 1
                    },
                    600: {
                        items: 2
                    },
                    1000: {
                        items: 3
                    }
                }
            });
        })
    </script>
@endpush
