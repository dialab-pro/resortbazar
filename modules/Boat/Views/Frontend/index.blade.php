@extends('layouts.app')
@section('content')
    <style>
        .section-title {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .custom-owl-nav button {
            background: transparent;
            border: none;
            font-size: 15px;
            color: white;
            padding: 5px 8px;
            cursor: pointer;
            background: black;
            border-radius: 20px;
        }

        .custom-owl-nav button:hover {
            color: #007bff;
            /* Add a hover effect */
        }

        .owl-carousel .owl-prev,
        .owl-carousel .owl-next {
            display: none;
            /* Hide default owl navigation */
        }

        .card {
            position: relative;
            overflow: hidden;
            border-radius: 10px
        }

        .overlay-content {
            opacity: 0;
            transition: opacity 0.3s ease-in-out;
            background-color: rgba(0, 0, 0, 0.6);
            text-align: center;
            /* padding: 10px; */
        }

        .card:hover .overlay-content {
            opacity: 1;
        }

        /* Custom Owl Carousel Arrows */
        .owl-theme .owl-nav [class*='owl-'] {
            background: #333;
            color: #fff;
            font-size: 18px;
            border-radius: 50%;
            padding: 10px 15px;
            margin: 5px;
            transition: background 0.3s ease;
        }

        .owl-theme .owl-nav [class*='owl-']:hover {
            background: #555;
        }

        .owl-theme .owl-nav .owl-prev {
            position: absolute;
            left: -25px;
            top: 50%;
            transform: translateY(-50%);
        }

        .owl-theme .owl-nav .owl-next {
            position: absolute;
            right: -25px;
            top: 50%;
            transform: translateY(-50%);
        }

        /* Centering the Dots */
        .owl-theme .owl-dots {
            text-align: center;
            margin-top: 15px;
        }

        /* Custom Dot Styles */
        .owl-theme .owl-dots .owl-dot {
            width: 12px;
            height: 12px;
            background: #ccc;
            border-radius: 50%;
            display: inline-block;
            margin: 5px;
            transition: background 0.3s ease;
            border: 2px solid transparent;
        }

        .owl-theme .owl-dots .owl-dot.active {
            background: #333;
            border-color: #333;
        }

        .owl-theme .owl-dots .owl-dot:hover {
            background: #555;
        }



        .stats-section {
            background-color: #0d3a71;
            color: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
        }

        .stats-item {
            padding: 10px;
        }

        .stats-number {
            font-size: 2rem;
            font-weight: bold;
        }

        .stats-label {
            font-size: 1rem;
        }

        .input-field-design {
            border: none;
            border-radius: 50px;
        }
    </style>
    <div class="container mt-4 mb-4">
        <div class="row">
            <div class="col-md-4 shadow-none p-3 mb-5 bg-light">
                <!---form-->
                <form action="{{ route('boat.front.searchBoat') }}" method="GET" class="mb-3">
                    {{-- @csrf --}}
                    <h4>Explore House Boats</h4>
                    <div class="form-group">
                        <label for="" class="form-label">Select Destination</label>
                        <select name="destination_id" class="form-control input-field-design" id="">
                            <option selected readonly value="">Select Destination</option>
                            @foreach ($boatDestinations as $destination)
                                <option value="{{ $destination->id }}">{{ $destination->title }}</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="" class="form-label">Check In Date</label>
                        <input type="text" class="form-control startDate input-field-design" name="start_date">
                    </div>

                    <div class="form-group">
                        <label for="" class="form-label">Check Out Date</label>
                        <input type="text" class="form-control endDate input-field-design" name="end_date">
                    </div>

                    <button style="width: 100%;border-radius: 20px;" type="submit"
                        class="btn btn-primary w-full">Search</a>
                </form>
            </div>
            <div class="col-md-8">
                <!--popular location--->

                <div class="container mb-4 mt-4">

                    <img style="border-radius: 10px" class="mb-4" src="{{ asset('images/LUXURY-HOUSE-BOAT.jpg') }}"
                        width="100%" height="200px" alt="">

                    <h4 class="section-title d-flex justify-content-between align-items-center">
                        Popular Locations
                        <div class="custom-owl-nav location-nav">
                            <button class="owl-prev location-prev"><i class="fa fa-chevron-left"></i></button>
                            <button class="owl-next location-next"><i class="fa fa-chevron-right"></i></button>
                        </div>
                    </h4>
                    <div class="row">
                        <div class="owl-carousel location-carousel owl-theme">
                            @foreach ($boatDestinations as $destination)
                                <div class="item">
                                    <div class="card text-white border-0">
                                        <img src="{{ asset($destination->image) }}" class="card-img"
                                            alt="{{ $destination->title ?? 'Destination Image' }}">
                                        <div
                                            class="card-img-overlay d-flex flex-column justify-content-center align-items-center overlay-content">
                                            <h5 class="card-title">{{ $destination->title ?? 'N/A' }}</h5>
                                            <p class="card-text">Experience the serene beauty of majestic mountains.</p>
                                            <a href="{{ route('boat.front.destinationDetails', $destination->slug) }}"
                                                class="btn btn-dark">View Location</a>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>

                    <h4 class="section-title d-flex justify-content-between align-items-center">
                        Popular Boats
                        <div class="custom-owl-nav boat-nav">
                            <button class="owl-prev boat-prev"><i class="fa fa-chevron-left"></i></button>
                            <button class="owl-next boat-next"><i class="fa fa-chevron-right"></i></button>
                        </div>
                    </h4>
                    <div class="row">
                        <div class="owl-carousel boat-carousel owl-theme">
                            @foreach ($boats->take(5) as $boat)
                                @php $images = json_decode($boat->image); @endphp
                                <div class="">
                                    <div class="card text-white border-0">
                                        <img src="{{ asset($images[0] ?? '') ?? 'https://loremflickr.com/200/200?random=1' }}"
                                            class="card-img" alt="{{ $boat->title ?? 'Boat Image' }}">
                                        <div
                                            class="card-img-overlay d-flex flex-column justify-content-center align-items-center overlay-content">
                                            <h5 class="card-title">{{ $boat->title ?? 'Boat Name' }}</h5>
                                            <p class="card-text">
                                                {{ \Illuminate\Support\Str::limit($boat->short_description ?? 'N/A', 50, '...') }}
                                            </p>
                                            <a href="{{ route('boat.front.boatDetails', $boat->slug) }}"
                                                class="btn btn-dark">View Boat</a>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>

                </div>


                <!---countdown--->
                <div class="container mt-5 p-2">
                    <div class="row stats-section">
                        <div class="col-6 col-md-3 stats-item">
                            <div class="stats-number" data-target="5000">0</div>
                            <div class="stats-label">Daily Visitor</div>
                        </div>
                        <div class="col-6 col-md-3 stats-item">
                            <div class="stats-number" data-target="60">0</div>
                            <div class="stats-label">Our Properties</div>
                        </div>
                        <div class="col-6 col-md-3 stats-item">
                            <div class="stats-number" data-target="10500">0</div>
                            <div class="stats-label">Our Customers</div>
                        </div>
                        <div class="col-6 col-md-3 stats-item">
                            <div class="stats-number" data-target="100">0</div>
                            <div class="stats-label">Our Agents</div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
@endsection

@push('js')
    <script>
        $(document).ready(function() {
            let currentDate = moment().format('YYYY-MM-DD');

            // Initialize the DateRangePicker for both inputs
            function initDateRangePicker() {
                $('.startDate, .endDate').daterangepicker({
                    startDate: currentDate, // Set initial start date to current date
                    endDate: currentDate, // Set initial end date to current date
                    autoApply: true, // Automatically apply the selection without needing the Apply button
                    autoUpdateInput: false,
                    locale: {
                        format: 'YYYY-MM-DD', // Set date format
                        cancelLabel: 'Clear' // Show clear button
                    }
                }, function(start, end) {
                    console.log("start date", start.format('YYYY-MM-DD'), 'end date', end.format(
                        "YYYY-MM-DD"));
                    // Update both Start and End date fields when a new range is selected
                    $('.startDate').val(start.format('YYYY-MM-DD'));
                    $('.endDate').val(end.format('YYYY-MM-DD'));
                });
            }

            // Initialize the DateRangePicker
            initDateRangePicker();

            // Set both Start and End date inputs with the current date initially
            console.log(currentDate);
            $('.startDate').val(currentDate);
            $('.endDate').val(currentDate);

            // If the user clears the selection, clear both fields
            $('.startDate, .endDate').on('cancel.daterangepicker', function(ev, picker) {
                $('.startDate').val('');
                $('.endDate').val('');
            });
        });

        // popular location owlcarousel
        $(document).ready(function() {
            // Popular Locations Carousel
            var locationOwl = $(".location-carousel");
            locationOwl.owlCarousel({
                stagePadding: 10,
                loop: true,
                margin: 10,
                nav: false, // Disable default navigation
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
                        items: 2
                    }
                }
            });

            // Custom Navigation for Locations
            $('.location-nav .location-next').click(function() {
                locationOwl.trigger('next.owl.carousel');
            });

            $('.location-nav .location-prev').click(function() {
                locationOwl.trigger('prev.owl.carousel');
            });

            // Popular Boats Carousel
            var boatOwl = $(".boat-carousel");
            boatOwl.owlCarousel({
                stagePadding: 10,
                loop: true,
                margin: 10,
                nav: false, // Disable default navigation
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

            // Custom Navigation for Boats
            $('.boat-nav .boat-next').click(function() {
                boatOwl.trigger('next.owl.carousel');
            });

            $('.boat-nav .boat-prev').click(function() {
                boatOwl.trigger('prev.owl.carousel');
            });
        });


        // counted number
        $(document).ready(function() {
            // Function to animate the counting up
            function animateCountUp($element, target) {
                let start = 0;
                let duration = 2000; // 2 seconds
                let increment = Math.ceil(target / (duration / 20)); // Set how fast it counts

                let countUp = setInterval(function() {
                    start += increment;
                    if (start >= target) {
                        $element.text(target.toLocaleString()); // Final value
                        clearInterval(countUp);
                    } else {
                        $element.text(start.toLocaleString()); // Interim value
                    }
                }, 20);
            }

            // Trigger the animation when the section is scrolled into view
            function isElementInViewport(el) {
                var rect = el.getBoundingClientRect();
                return (
                    rect.top >= 0 &&
                    rect.left >= 0 &&
                    rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
                    rect.right <= (window.innerWidth || document.documentElement.clientWidth)
                );
            }

            function checkViewport() {
                $('.stats-number').each(function() {
                    var $this = $(this);
                    if (isElementInViewport(this) && !$this.hasClass('animated')) {
                        var targetNumber = parseInt($this.data('target'));
                        animateCountUp($this, targetNumber);
                        $this.addClass('animated'); // Avoid running the animation again
                    }
                });
            }

            // Check viewport on page load and on scroll
            $(window).on('scroll', checkViewport);
            checkViewport(); // Also check on load in case the stats section is already in view
        });
    </script>
@endpush
