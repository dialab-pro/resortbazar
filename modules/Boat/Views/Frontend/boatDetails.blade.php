@extends('layouts.app')
@section('content')
    <style>
        .cabin-card {
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .cabin-card:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        .status-available {
            color: green;
        }

        .status-booked {
            color: red;
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
        .card-img {
            height: 200px;
            object-fit: cover;
        }



        .see-more,
        .see-less {
            cursor: pointer;
            text-decoration: underline;
            border: none;
            background: none;
            padding: 0;
            font: inherit;
            color: #007bff;
        }


        .card-img-overlay .badge {
            position: absolute;
            top: 10px;
            /* Adjust as needed */
            left: 10px;
            /* Adjust as needed */
            z-index: 10;
            /* Ensures badge is on top */
            font-size: 14px;
            /* Optional: adjust font size */
        }


        /* review section  */
        .review-section {
            padding: 40px 20px;
            background-color: #f8f9fa;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .review-card {
            border: none;
            background-color: #ffffff;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }

        .review-card .star-rating {
            color: #ffc107;
            margin-bottom: 10px;
        }

        .review-card .reviewer-name {
            font-weight: 600;
            margin-bottom: 5px;
        }

        .review-card .review-date {
            color: #6c757d;
            font-size: 0.9rem;
        }

        .review-card .review-text {
            font-size: 1rem;
            line-height: 1.5;
            margin-top: 10px;
        }

        .review-input-form {
            margin-top: 40px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }

        .form-control:focus {
            border-color: #80bdff;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }


        /* Custom Modal Dialog */
        .custom-modal-dialog {
            max-width: 50%;
            /* Set the modal width to 50% */
            margin: auto;
            /* Center the modal */
        }

        /* Ensure proper centering on smaller screens */
        @media (max-width: 767.98px) {
            .custom-modal-dialog {
                max-width: 90%;
                /* Adjust for smaller screens if needed */
            }
        }


        /* tab style  */
        /* Tab Navigation */
        .nav {
            display: flex;
            justify-content: flex-start;
            /* border-bottom: 2px solid #ddd; */
            margin-bottom: 20px;
            background: #E9ECEF;
        }

        .nav-item {
            list-style: none;
            /* margin-right: 10px; */
            /* padding: 10px 0px; */
        }

        .nav-link {
            display: inline-block;
            padding: 12px 10px;
            border: 1px solid transparent;
            border-radius: 4px 4px 0 0;
            color: black;
            text-decoration: none;
            transition: background-color 0.3s, border-color 0.3s;
        }

        .nav-link:hover {
            background-color: #f0f0f0;
            border-color: #ddd;
            color: #007bff
        }

        .nav-link.active {
            background-color: #CED4DA !important;
            border-color: #ddd;
            border-bottom-color: transparent;
            color: black !important;
        }

        .nav-link.disabled {
            color: #6c757d;
            pointer-events: none;
            cursor: not-allowed;
        }

        /* Tab Content */
        .tab-content {
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 20px;
        }

        .tab-pane {
            display: none;
        }

        .tab-pane.active {
            display: block;
        }


        /* responsive date picker */
        .responsive-datepicker-box {
            width: 50%;
            margin: auto;
            text-align: center;
            border: 1px solid lightgray;
            border-radius: 50px;
        }

        /* For small devices (up to 767px) */
        @media (max-width: 767px) {
            .responsive-datepicker-box {
                width: 80%;
            }
        }

        /* cabin details skteleton modal css  */
        .skeleton-loader {
            display: flex;
            flex-direction: column;
        }

        .skeleton-image {
            width: 100%;
            height: 300px;
            background-color: #e0e0e0;
            margin-bottom: 10px;
        }

        .skeleton-title {
            width: 60%;
            height: 20px;
            background-color: #e0e0e0;
            margin-bottom: 10px;
        }

        .skeleton-text {
            width: 80%;
            height: 15px;
            background-color: #e0e0e0;
        }


        /* cabin card skeleton */
        .skeleton-img,
        .skeleton-badge,
        .skeleton-title,
        .skeleton-price,
        .skeleton-button {
            position: relative;
            overflow: hidden;
            background-color: #e0e0e0;
        }

        .skeleton-img::before,
        .skeleton-badge::before,
        .skeleton-title::before,
        .skeleton-price::before,
        .skeleton-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -150px;
            width: 100px;
            height: 100%;
            background: linear-gradient(90deg, rgba(255, 255, 255, 0) 0%, rgba(255, 255, 255, 0.2) 50%, rgba(255, 255, 255, 0) 100%);
            animation: loading 1.5s infinite;
        }

        @keyframes loading {
            0% {
                left: -150px;
            }

            50% {
                left: 150px;
            }

            100% {
                left: 300px;
            }
        }
    </style>
    <!-- Header Section -->
    <section class="header-image"
        style="background-image: url('{{ asset($boat->banner_image ?? '') }}');
            background-size: cover;
            background-position: center;
            height: 300px;
            position: relative;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);">
        <h1 class="display-4">{{ $boat->title ?? '' }}</h1>
    </section>


    <!-- Cabin Cards Section -->
    <section class="container my-5">
        @if (session('success'))
            <div class="alert alert-success">
                {{ session('success') }}
            </div>
        @endif

        @if (session('error'))
            <div class="alert alert-danger">
                {{ session('error') }}
            </div>
        @endif

        <h4 class="text-center">Search Date Range</h4>
        <div class="text-center mx-auto">
            <input type="text" class="form-control has-daterangepicker responsive-datepicker-box">
            <div class="checkingDate mt-2">
                @if ($checkingDate)
                    <p>Selected Checking Date: {{ $checkingDate ?? '' }}</p>
                @endif
            </div>
        </div>


        <h2>Cabins</h2>
        <button style="border: none; padding: 7px 19px;color: white;background-color: #00AEEF;font-weight: 100;" class="btn btn-success mb-3 selectAllAvailable">Select All Cabin</button>

        <div class="row">
            <!--loading skeleton for this cabin-->
            <div class="col-md-4 mb-4 cabincardskeleton" style="display: none">
                <div class="card text-white border-0 position-relative">
                    <!-- Skeleton image -->
                    <div class="skeleton-img bg-secondary" style="width: 100%; height: 200px;"></div>

                    <!-- Skeleton badge -->
                    <span class="skeleton-badge bg-secondary position-absolute top-0 start-0 p-2"
                        style="width: 80px; height: 20px; margin: 10px;"></span>

                    <!-- Card content skeleton -->
                    <div
                        class="card-img-overlay d-flex flex-column justify-content-center align-items-center overlay-content">
                        <!-- Skeleton title -->
                        <div class="skeleton-title bg-secondary mb-2" style="width: 60%; height: 20px;"></div>

                        <!-- Skeleton price -->
                        <div class="skeleton-price bg-secondary mb-2" style="width: 40%; height: 20px;"></div>

                        <!-- Skeleton buttons -->
                        <div class="d-flex justify-content-between w-100">
                            <div class="skeleton-button bg-secondary" style="width: 30%; height: 40px;"></div>
                            <div class="skeleton-button bg-secondary" style="width: 30%; height: 40px;"></div>
                        </div>
                    </div>
                </div>
            </div>

            <!--loading skeleton for this cabin end-->
            @if ($boat->boatCabin)
                @foreach ($boat->boatCabin as $cabin)
                    @php
                        $features = $cabin->cabin_feature ? json_decode($cabin->cabin_feature) : [];
                        $images = $cabin->image ? json_decode($cabin->image) : [];
                        $bookedCabinIdsArray = $bookedCabinIds->toArray();
                        $isBooked = in_array((string) $cabin->id, $bookedCabinIdsArray); // Convert cabin ID to string for comparison
                    @endphp
                    <div class="col-md-4 mb-4">
                        <div class="card text-white border-0 position-relative">
                            <img src="{{ !empty($images) ? asset($images[0]) : asset('images/avatar.png') }}"
                                class="card-img" alt="{{ $cabin->title ?? 'Boat Image' }}">
                            <span
                                class="badge {{ $isBooked ? 'bg-danger' : 'bg-success' }} position-absolute top-0 start-0 p-2"
                                style="z-index: 10;">
                                {{ $isBooked ? 'Booked' : 'Available' }}
                            </span>
                            <div
                                class="card-img-overlay d-flex flex-column justify-content-center align-items-center overlay-content">
                                <h5 class="card-title">{{ $cabin->title ?? 'Boat Name' }}</h5>
                                <p class="card-text">

                                </p>
                                <p>Price: {{ $cabin->price }}</p>
                                <div class="d-flex justify-content-between">
                                    <button type="button" class="btn btn-dark cabinDetails" data-id="{{ $cabin->id }}"
                                        data-title="{{ $cabin->title }}" data-price="{{ $cabin->price }}"
                                        data-person="{{ $cabin->person }}"
                                        data-extra-person-fee="{{ $cabin->extra_person_fee }}"
                                        data-images='@json($images)'>Details</button>
                                    <button type="button" data-id="{{ $cabin->id }}" data-title="{{ $cabin->title }}"
                                        data-price="{{ $cabin->price }}" data-person="{{ $cabin->person }}"
                                        data-extra-person-fee="{{ $cabin->extra_person_fee }}"
                                        class="btn btn-primary mx-3 bookButton {{ $isBooked ? 'disabled' : 'bookCabin' }}"
                                        {{ $isBooked ? 'aria-disabled=true' : '' }}>
                                        Book
                                    </button>

                                </div>

                            </div>
                        </div>
                    </div>
                @endforeach

                <!--cabin details modal-->
                <!-- Cabin Details Modal -->
                <div class="modal fade" id="cabinDetailsModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-md">
                        <div class="modal-content">
                            <div class="modal-header text-black">
                                <h5 class="modal-title" id="exampleModalLabel">Cabin Details</h5>
                                <button type="button" class="btn-close border-0" data-bs-dismiss="modal"
                                    aria-label="Close">x</button>
                            </div>
                            <div class="modal-body">
                                <div id="cabinSkeleton">
                                    <!-- Skeleton for the image carousel -->
                                    <div class="skeleton skeleton-carousel"></div>

                                    <!-- Skeleton for the text content -->
                                    <div class="skeleton skeleton-text"></div>
                                    <div class="skeleton skeleton-text"></div>
                                    <div class="skeleton skeleton-text short"></div>
                                </div>
                                <div id="cabinDetailsContent" style="display:none;">


                                    <!-- Bootstrap Carousel -->
                                    <div id="cabinImageCarousel" class="carousel slide" data-ride="carousel">
                                        <div class="carousel-inner"></div>
                                        <a class="carousel-control-prev" href="#cabinImageCarousel" role="button"
                                            data-slide="prev">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="carousel-control-next" href="#cabinImageCarousel" role="button"
                                            data-slide="next">
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>

                                    <!-- Cabin details -->
                                    <table class="table">
                                        <tr>
                                            <th>Cabin Name</th>
                                            <td>
                                                <p id="cabinTitle"></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Cabin Price</th>
                                            <td>
                                                <p id="cabinPrice"></p>
                                            </td>
                                        </tr>

                                        <tr>
                                            <th>Cabin Capacity</th>
                                            <td>
                                                <p id="cabinCapacity"></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Extra Person Fee</th>
                                            <td>
                                                <p id="extraPersonFee"></p>
                                            </td>
                                        </tr>


                                    </table>

                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary btn-close"
                                    data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!---cabin details modal end-->
            @endif
            <form action="{{ route('boat.front.boatCabinBooking') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="selectedCabin table-responsive" style="display: none;">
                    <h4>Slected Cabin</h4>
                    <table class="table align-middle">
                        <thead>
                            <th>Sl.</th>
                            <th>Cabin Name</th>
                            <th>Cabin Price</th>
                            <th>Person</th>
                            <th>Extra Person</th>
                            <th>Extra Person Fee</th>
                            <th>Total Price</th>
                            <th>Action</th>
                        </thead>
                        <tbody class="selectedCabinList">

                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="3">SubTotal: <span id="subtotal"></span></td>
                                <input type="hidden" name="subtotal" class="subtotalInputValue">
                                <td colspan="3">Total: <span id="total"></span></td>
                                <input type="hidden" name="totalAmount" class="totalInputValue">
                            </tr>
                        </tfoot>
                    </table>
                    <div>
                        <input type="hidden" name="boat_id" class="boatId" value="{{ $boat->id }}">
                        <input type="hidden" name="check_in_date" class="checkInDate"
                            value="{{ $checkingDate ?? '' }}">
                        <input type="hidden" name="check_out_date" class="checkOutDate"
                            value="{{ $checkoutDate ?? '' }}">

                        <button type="submit" class="btn btn-primary">Process to booking</button>
                    </div>
                </div>
            </form>

        </div>



    </section>

    <!---tabs--->
    <section class="container my-5">
        <h2>Boat Info</h2>
        <ul class="nav nav-pills">
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#boatDetails" data-tab="boatDetails">Boat
                    Details</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#googlemap" data-tab="googlemap">Boat Map</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#foodmenu" data-tab="foodmenu">Resturant Food Menu</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#restriction" data-tab="restriction">Restriction</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#smoking_rule" data-tab="smoking_rule">Smoking/Alcohol Consumption Rules</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#petpolicy" data-tab="petpolicy">Pets Policy</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#child_policy" data-tab="child_policy">Child Policy</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#extra_bed_policy" data-tab="extra_bed_policy">Extra Bed Policy</a>
            </li>

        </ul>

        <div class="tab-content border-0">
            <div id="boatDetails" class="tab-pane active">
                {!! $boat->long_description !!}
            </div>
            <div id="googlemap" class="tab-pane">
                {!! $boat->map_link ?? 'no map url' !!}
            </div>
            <div id="foodmenu" class="tab-pane">
                {!! $boat->food_menu ?? 'no food menu' !!}
            </div>
            <div id="restriction" class="tab-pane">
                {!! $boat->restriction ?? 'no restriction' !!}
            </div>
            <div id="smoking_rule" class="tab-pane">
                {!! $boat->smoking_rule ?? 'no rule here' !!}
            </div>
            <div id="petpolicy" class="tab-pane">
                {!! $boat->pets_policy ?? 'no pet policy here' !!}
            </div>
            <div id="child_policy" class="tab-pane">
                {!! $boat->child_policy ?? 'no Child policy here' !!}
            </div>
            <div id="extra_bed_policy" class="tab-pane">
                {!! $boat->extra_bed_policy ?? 'no Extra bed policy here' !!}
            </div>


        </div>
    </section>

    <!---tabs end-->

    <!-- Overview Section -->
    <section class="container my-5">
        <div class="review-section">
            <h3 class="mb-4">Customer Reviews</h3>
            <div class="review-card">
                <div class="star-rating">
                    ★★★★☆
                </div>
                <div class="reviewer-name">John Doe</div>
                <div class="review-date">September 17, 2024</div>
                <p class="review-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent euismod nisl a
                    ligula malesuada, eget bibendum justo cursus.</p>
            </div>
            <div class="review-card">
                <div class="star-rating">
                    ★★★★★
                </div>
                <div class="reviewer-name">Jane Smith</div>
                <div class="review-date">September 16, 2024</div>
                <p class="review-text">Quisque efficitur lacus ac erat sollicitudin, vel suscipit felis convallis. Vivamus
                    vel diam nec nisl tincidunt malesuada.</p>
            </div>
            <!-- Add more review-cards as needed -->
            @auth
                <!-- Review Input Form -->
                <form class="review-input-form">
                    <h4 class="mb-3">Leave a Review</h4>
                    <div class="mb-3">
                        <label for="reviewerName" class="form-label">Name</label>
                        <input type="text" class="form-control" id="reviewerName" placeholder="Your Name" required>
                    </div>
                    <div class="mb-3">
                        <label for="starRating" class="form-label">Rating</label>
                        <select class="form-select" id="starRating" required>
                            <option value="" selected disabled>Select Rating</option>
                            <option value="1">★☆☆☆☆</option>
                            <option value="2">★★☆☆☆</option>
                            <option value="3">★★★☆☆</option>
                            <option value="4">★★★★☆</option>
                            <option value="5">★★★★★</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="reviewText" class="form-label">Review</label>
                        <textarea class="form-control" id="reviewText" rows="3" placeholder="Write your review here..." required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit Review</button>
                </form>
            @endauth
            @guest
                <p class="text-danger ">Please login For Review</p>
            @endguest
        </div>
    </section>



@endsection

@push('js')
    <script>
        // booking script
        let selectedCabins = [];
        let subtotal = 0;

        $(document).on("click", ".bookCabin", function() {
            let cabinId = $(this).attr('data-id');
            let cabinTitle = $(this).attr('data-title');
            let cabinPrice = parseFloat($(this).attr('data-price')) || 0;
            let cabinPerson = $(this).attr('data-person');
            let cabinExtraPersonFee = parseFloat($(this).attr('data-extra-person-fee')) || 0;

            const cabinExists = selectedCabins.some(cabin => cabin.id === cabinId);
            if (!cabinExists) {
                selectedCabins.push({
                    id: cabinId,
                    title: cabinTitle,
                    price: cabinPrice,
                    person: cabinPerson,
                    extra_fee: cabinExtraPersonFee,
                    additional_persons: 0,
                    total: cabinPrice
                });
                updateSelectedCabins();
                updatePricing();
            }
        });

        $(document).on("click", ".selectAllAvailable", function() {
            $(".bookCabin:not(.disabled)").each(function() {
                $(this).click();
            });
        });

        function updateSelectedCabins() {
            if (selectedCabins.length === 0) {
                $(".selectedCabin").hide();
            } else {
                $(".selectedCabin").show();
            }
            $('.selectedCabinList').empty();
            selectedCabins.forEach((cabin, index) => {
                $('.selectedCabinList').append(`
            <tr class="row_${cabin.id}">
                <input type="hidden" name="cabinid[]" value="${cabin.id}">
                <td>${index + 1}</td>
                <td>${cabin.title}</td>
                <td>${cabin.price.toFixed(2)}</td>
                <td>${cabin.person}</td>
                <td>${cabin.additional_persons}
                    <input type="hidden" name="extra_person[${cabin.id}]" value="${cabin.additional_persons}">
                </td>
                <td>${cabin.extra_fee.toFixed(2)}</td>
                <td>${cabin.total.toFixed(2)}
                    <input type="hidden" name="cabin_total[${cabin.id}]" value="${cabin.total.toFixed(2)}">
                </td>
                <td>
                    <input type="number" min="0" class="additionalPersonsInput form-control" data-id="${cabin.id}" style="display: none;" placeholder="Enter persons">
                    <button type="button" data-id="${cabin.id}" class="btn btn-primary addPerson">Extra Person</button>
                    <button type="button" data-id="${cabin.id}" class="btn btn-danger deleteRow">Delete</button>
                </td>
            </tr>
        `);
            });
        }

        function updatePricing() {
            subtotal = selectedCabins.reduce((sum, cabin) => sum + cabin.total, 0);
            const total = subtotal;
            $('#subtotal').text(subtotal.toFixed(2));
            $('.subtotalInputValue').val(subtotal.toFixed(2));
            $('#total').text(total.toFixed(2));
            $('.totalInputValue').val(total.toFixed(2));
        }

        $(document).on("click", ".deleteRow", function() {
            const cabinId = $(this).attr('data-id');
            selectedCabins = selectedCabins.filter(cabin => cabin.id !== cabinId);
            updateSelectedCabins();
            updatePricing();
        });


        $(document).on("click", ".addPerson", function() {
            const cabinId = $(this).attr('data-id');
            $(`input[data-id='${cabinId}']`).toggle();
        });


        $(document).on("change", ".additionalPersonsInput", function() {
            const cabinId = $(this).attr('data-id');
            const additionalPersons = parseInt($(this).val()) || 0;
            const cabin = selectedCabins.find(cabin => cabin.id === cabinId);
            if (cabin) {
                cabin.additional_persons = additionalPersons;
                cabin.total = cabin.price + (cabin.additional_persons * cabin.extra_fee);
                updatePricing();
                updateSelectedCabins();
            }
        });


        // details script


        $(document).on("click", ".btn-close", function() {
            $("#cabinDetailsModal").modal('hide');
        })






        // Handle click event on the Details button
        $(document).on('click', '.cabinDetails', function() {
            // Show the skeleton loader and hide the actual content
            $('#cabinSkeleton').show();
            $('#cabinDetailsContent').hide();

            // Get data attributes from the clicked button
            var cabinId = $(this).data('id');
            var cabinTitle = $(this).data('title');
            var cabinPrice = $(this).data('price');
            var cabinPerson = $(this).data('person');
            var extraPersonFee = $(this).data('extra-person-fee');
            var images = JSON.parse($(this).attr('data-images'));

            // Update modal content with data
            $('.modal-title').text('Details for ' + cabinTitle);
            $('#cabinTitle').text(cabinTitle);
            $('#cabinPrice').text('' + cabinPrice);
            $('#cabinCapacity').text(cabinPerson + ' persons');
            $('#extraPersonFee').text('' + extraPersonFee);

            let carouselInner = '';

            // Add images to the carousel-inner
            images.forEach(function(image, index) {
                var fullUrl = window.location.origin + "/" + image;
                var activeClass = index === 0 ? 'active' : ''; // Make the first item active
                carouselInner += `
            <div class="carousel-item ${activeClass}">
                <img src="${fullUrl}" class="d-block w-100 img-fluid" alt="Cabin Image" style="height: 300px; width: 100%;">
            </div>
        `;
            });

            // Update the carousel with new images
            $(".carousel-inner").html(carouselInner);

            // Show the modal after content is updated
            var modal = $('#cabinDetailsModal');
            modal.modal('show');

            // Once the modal is shown, hide the skeleton and show the content
            modal.on('shown.bs.modal', function() {
                $('#cabinSkeleton').hide();
                $('#cabinDetailsContent').show();
            });
        });
    </script>

    <script>
        // script for tab
        $(document).ready(function() {
            $('.nav-link').on('click', function(e) {
                e.preventDefault();

                // Get the target tab id
                var tabId = $(this).attr('data-tab');

                // Remove 'active' class from all nav-links
                $('.nav-link').removeClass('active');

                // Add 'active' class to the clicked nav-link
                $(this).addClass('active');

                // Hide all tab content
                $('.tab-pane').removeClass('active');

                // Show the selected tab content
                $('#' + tabId).addClass('active');
            });
        });



        function checkInDateAvailality() {
            let checkInDate = $(".checkInDate").val();
            let boatId = $(".boatId").val();
            console.log("checking Date", checkInDate, boatId)
            scheduleCheckInDate(checkInDate, boatId);
        }

        function scheduleCheckInDate(checkInDate, boatId) {
            $.ajax({
                url: "{{ route('boat.front.scheduleCheckInDateByCheckInDate') }}",
                type: 'POST',
                data: {
                    'checkInDate': checkInDate,
                    'boat_id': boatId
                },
                headers: {
                    'X-CSRF-TOKEN': "{{ csrf_token() }}"
                },
                success: function(response) {

                    console.log('Form submitted successfully:', response);
                    if (response?.message === 'failed' && response?.schedule === false) {
                        $('.card').each(function() {
                            let cabinBadge = $(this).find('.badge');
                            let cabinBookButton = $(this).find('.bookButton');

                            cabinBadge.removeClass('bg-success bg-danger').addClass('bg-secondary')
                                .text(
                                    'Boat not available');
                            cabinBookButton.addClass('disabled').attr('aria-disabled', true).text(
                                'Unavailable').removeClass('bookCabin');

                        });
                    } else if (response?.message === 'success') {
                        let bookedCabinIds = response?.bookedCabinIds;
                        $('.bookButton').each(function() {
                            let cabinId = $(this).data('id')
                                .toString();
                            let isBooked = bookedCabinIds.includes(
                                cabinId);

                            let cabinBadge = $(this).closest('.card').find('.badge');
                            let cabinBookButton = $(this);
                            if (isBooked) {
                                cabinBadge.removeClass('bg-success').addClass('bg-danger').text(
                                    'Booked');
                                cabinBookButton.addClass('disabled').attr('aria-disabled', true)
                                    .removeClass('bookCabin');
                            } else {
                                cabinBadge.removeClass('bg-danger').addClass('bg-success').text(
                                    'Available');
                                cabinBookButton.removeClass('disabled').attr('aria-disabled', false)
                                    .addClass('bookCabin');
                            }
                        });
                        $(".cabincardskeleton").hide();

                    }
                },
                error: function(xhr, status, error) {
                    console.error('Form submission error:', error);
                    // Handle error logic here
                    $(".cabincardskeleton").hide();
                }
            });
        }


        function datepickerrange() {
            let checkInDate = $(".checkInDate").val() || moment().format('YYYY-MM-DD');
            let checkoutDate = $(".checkOutDate").val() || moment().format('YYYY-MM-DD');
            console.log("start date, end date", checkInDate, checkoutDate, moment().format('YYYY-MM-DD'));

            // date time picker
            $('.has-daterangepicker').daterangepicker({
                locale: {
                    format: 'YYYY-MM-DD'
                },
                startDate: checkInDate,
                endDate: checkoutDate
            });

            $('.has-daterangepicker').on('apply.daterangepicker', function(ev, picker) {

                $(".checkingDate").empty();
                $(".checkingDate").append(
                    `<p>Selected Checking Date: ${picker.startDate.format('YYYY-MM-DD')}</p>`
                );
                $(".checkInDate").val(picker.startDate.format('YYYY-MM-DD'));
                $(".checkOutDate").val(picker.endDate.format('YYYY-MM-DD')); // Use .checkOutDate here
                console.log(picker.startDate.format('YYYY-MM-DD'));
                console.log(picker.endDate.format('YYYY-MM-DD'));

                // Update query parameters in URL
                let newSearchParams = new URLSearchParams(window.location.search);
                newSearchParams.set('checking_date', picker.startDate.format('YYYY-MM-DD'));
                newSearchParams.set('checkout_date', picker.endDate.format('YYYY-MM-DD'));
                window.location.search = newSearchParams.toString();

            });
        }



        $(document).ready(function() {
            $(".cabincardskeleton").show();
            checkInDateAvailality();
            datepickerrange();
        })
    </script>
@endpush
