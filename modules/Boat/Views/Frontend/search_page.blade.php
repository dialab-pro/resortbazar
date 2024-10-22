@extends('layouts.app')
@section('content')
    <style>
        .scrollable-section {
            max-height: 600px;
            /* Adjust as needed */
            overflow-y: scroll;
            -ms-overflow-style: none;
            /* Internet Explorer and Edge */
            scrollbar-width: none;
            /* Firefox */
        }

        .scrollable-section::-webkit-scrollbar {
            display: none;
            /* Safari and Chrome */
        }

        .boatDesign {
            border: 1px solid darkgray;
            border-radius: 10px;
            height: 400px;
        }

        .cabin {
            padding: 20px;
            background-color: gray;
            color: white;
            margin: 9px;
        }

        .skeleton-line {
            height: 20px;
            margin: 10px 0;
            background-color: #ddd;
            border-radius: 4px;
            animation: pulse 1.5s infinite ease-in-out;
        }

        @keyframes pulse {
            0% {
                background-color: #ddd;
            }

            50% {
                background-color: #e2e2e2;
            }

            100% {
                background-color: #ddd;
            }
        }


        /* new card style  */
        .boat-title {
            font-weight: 800;
            font-size: xx-large;
        }

        .reviewsection {
            text-align: left
        }

        .reviewstar {
            display: inline-flex;
            color: #EAB308;
            font-weight: 600;
            margin-bottom: 0;
        }

        .amount-style {
            font-weight: 800;
            color: #173C6C;
            font-size: xx-large;
            margin-bottom: 0
        }

        .button-group {
            display: flex;
            flex-direction: column;
            justify-content: end;
            align-items: center;
        }

        .book-boat-button {
            border: 0;
            padding: 5px 30px;
            background: #FA7335;
            color: white;
            border-radius: 20px;
            margin: 10px 0px;
            width: 100%
        }

        .book-cabin-button {
            border: 0;
            padding: 5px 30px;
            background: #5191FA;
            color: white;
            border-radius: 20px;
            margin: 10px 0px;
            width: 100%
        }

        .card-footer-style {
            background: linear-gradient(90deg, rgb(0 0 0) 0%, rgb(17 26 38 / 84%) 52%, rgb(15 34 58) 100%);
            border-radius: 10px
        }

        .badge-style {
            background: transparent;
            color: black;
            font-size: x-small;
            font-weight: 800;
            border: 1px solid gray;
            padding: 3px 10px;
            border-radius: 20px;
            margin-bottom: 5px
        }

        .footer-button-style {
            border: 1px solid white;
            background: white;
            color: black;
            border-radius: 20px;
            padding: 3px 15px 3px 15px;
            font-size: smaller;
        }


        /* tab style  */
        .lead {
            font-size: 1.25rem;
            font-weight: 300;
            color: #3d3f5d;
        }

        .tab-regular .nav.nav-tabs {
            border-bottom: transparent;
        }

        .tab-regular .nav.nav-tabs .nav-item {}

        .tab-regular .nav.nav-tabs .nav-link {
            display: block;
            padding: 10px 38px;
            color: #71748d;
            background-color: #dddde8;
            margin-right: 5px;
            border-color: #dddde8;
            border-radius: 10px 10px 4px 4px;
            margin-bottom: 10px;
            text-align: center
        }

        .tab-regular .nav-tabs .nav-link.active {
            background-color: #fff;
            border-color: #e6e6f2 #e6e6f2 #fff;
            color: #5969ff;
        }

        .tab-regular .tab-content {
            background-color: #fff;
            padding: 30px;
            /* border: 1px solid #e6e6f2; */
            border-radius: 4px;
            border-top-left-radius: 0px
        }


        /* owl carousel */
        .owl-prev,
        .owl-next {
            background-color: #333;
            color: #fff;
            padding: 0px 8px;
            font-size: 18px;
            border-radius: 50%;
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            z-index: 1000;
        }

        .owl-prev {
            left: 10px;
            /* Positioning the previous arrow */
        }

        .owl-next {
            right: 10px;
            /* Positioning the next arrow */
        }

        .owl-prev:hover,
        .owl-next:hover {
            background-color: #555;
        }

        .input-field-design {
            border: none;
            border-radius: 50px;
        }
    </style>
    <div class="container mt-4 mb-4">
        <div class="row">
            <div class="col-md-4 rounded border-0 p-3 mb-3">
                <!---form-->
                <form style="background-color: #F8F9FA" action="{{ route('boat.front.searchBoat') }}" method="GET"
                    class="mb-3">
                    {{-- @csrf --}}
                    <h4>Explore House Boats</h4>
                    <div class="form-group">
                        <label for="" class="form-label">Select Destination</label>
                        <select name="destination_id" class="form-control input-field-design" id="">
                            <option selected value="" readonly>Select Destination</option>
                            @foreach ($boatDestinations as $destination)
                                <option @if ($destinationId == $destination->id) selected @endif value="{{ $destination->id }}">
                                    {{ $destination->title }}</option>
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
                    <button type="submit" style="width: 100%;border-radius: 20px;" class="btn btn-primary">Search</a>
                </form>
            </div>
            <div class="col-md-8 scrollable-section">
                <p style="font-size: larger;font-weight: 800">Result of Boats <span>{{ $boats->count() }} founds</span></p>
                <!--card-->
                @foreach ($boats as $key => $boat)
                    @php
                        $lowestCabinPrice = null;
                        foreach ($boat->boatCabin as $key => $cabin) {
                            if (is_null($lowestCabinPrice) || $cabin->price < $lowestCabinPrice) {
                                $lowestCabinPrice = $cabin->price;
                            }
                        }
                    @endphp
                    <div class="row mt-3 mb-3 border rounded-md" style="background-color: #F8F9FA">
                        <div class="col-md-4 p-0">
                            @php
                                $images = json_decode($boat->image);
                            @endphp

                            <div class="owl-carousel owl-theme">
                                @foreach ($images as $image)
                                    <div class="item">
                                        <img src="{{ asset($image) }}" class="img-fluid" alt="Sindabad Tori">
                                    </div>
                                @endforeach
                            </div>
                        </div>
                        <div class="col-md-5">
                            <h1 class="boat-title">{{ $boat->title ?? 'N/A' }}</h1>
                            <p><i class="fas fa-map-marker-alt"></i> {{ $boat->destination->title ?? 'N/A' }}</p>
                            <div class="row">
                                <div class="col-md-5">
                                    @if ($boat->boatFeature)
                                        @foreach ($boat->boatFeature as $feature)
                                            <span class="badge badge-style"><i
                                                    class="fa-regular fa-circle-check"></i>{{ $feature->title ?? '' }}</span>
                                        @endforeach
                                    @endif

                                </div>
                            </div>
                        </div>


                        <div class="col-md-3">
                            <div class="reviewsection">
                                <p class="reviewstar"><i class="fas fa-star"></i>
                                    <span style="color: #16A376">5/5 Very Good</span>
                                    <span style="color: #A7A7A7">(450)</span>
                                </p>
                                <small>start from</small>
                                <p class="amount-style">Tk. {{ number_format((float) $boat->boat_price / 19) ?? '' }}</p>
                                <small>per person</small>
                                <div class="button-group">
                                    <form style="width: 100%"
                                        action="{{ route('boat.front.fullBoatDetails', $boat->slug) }}" method="GET">
                                        <input type="hidden" name="checking_date" value="{{ $checkingDate }}">
                                        <button class="book-boat-button text-center">Book Boat</button>
                                    </form>
                                    <form class="d-flex justify-content-end" style="width: 100%"
                                        action="{{ route('boat.front.boatDetails', $boat->slug) }}" method="GET">
                                        <input type="hidden" name="checking_date" value="{{ $checkingDate }}">
                                        <input type="hidden" name="checkout_date" value="{{ $checkoutDate }}">
                                        <button class="book-cabin-button">Book Cabin</button>
                                    </form>
                                </div>
                            </div>

                        </div>


                        <div class="col-md-12 card-footer-style">
                            <div class="d-flex flex-column flex-md-row justify-content-between text-white text-center">
                                <div class=" mt-1 mb-1">
                                    {{-- <button class="footer-button-style">
                                        Available For Booking
                                    </button> --}}
                                </div>
                                <div class=" mt-1 mb-1" style="display: flex;justify-content: center; align-items: center;">
                                    <button class="footer-button-style boatInfo"
                                        boat-details="{{ $boat->long_description ?? 'N/A' }}"
                                        boat-map="{{ $boat->map_link ?? 'N/A' }}"
                                        food-menu="{{ $boat->food_menu ?? 'N/A' }}"
                                        restriction="{{ $boat->restriction ?? 'N/A' }}"
                                        smokingRule = "{{ $boat->smoking_rule ?? 'N/A' }}"
                                        pet-policy= "{{ $boat->pets_policy ?? 'N/A' }}"
                                        child-policy = "{{ $boat->child_policy ?? 'N/A' }}"
                                        extra-bed-policy="{{ $boat->extra_bed_policy ?? 'N/A' }}">
                                        <i class="fas fa-info-circle"></i> Boat Info</button>
                                </div>
                                <div class=" mt-1 mb-1" style="display: flex;justify-content: center; align-items: center;">
                                    <button class="footer-button-style checkInOutTimeButton"
                                        data-checkInTime= "{{ $boat->check_in_time ?? '' }}"
                                        data-checkOutTime={{ $boat->check_out_time ?? '' }}><i
                                            class="fa-regular fa-circle-check text-xs"></i>
                                        CheckIn-Out</button>
                                </div>
                                <div class=" mt-1 mb-1" style="display: flex;justify-content: center; align-items: center;">
                                    <button data-cancelation-policy="{{ $boat->cancelation_policy ?? 'N/A' }}"
                                        class="footer-button-style cancelationPolicyButton"><i
                                            class="fa-regular fa-handshake"></i>
                                        Cancelation
                                        Policy</button>
                                </div>
                            </div>
                        </div>

                    </div>
                @endforeach
                <!--card-->
                @if ($relatedBoats->count() > 0)
                    <h4 class="mb-4 mt-5">Related Boat of This Location</h4>
                    <hr>

                    @foreach ($relatedBoats as $key => $boat)
                        <div class="row mt-3 mb-3 border rounded-md" style="background-color: #F8F9FA">
                            <div class="col-md-4 p-0">
                                @php
                                    $images = json_decode($boat->image);
                                @endphp

                                <div class="owl-carousel owl-theme">
                                    @foreach ($images as $image)
                                        <div class="item">
                                            <img src="{{ asset($image) }}" class="img-fluid" alt="Sindabad Tori">
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                            <div class="col-md-5">
                                <h1 class="boat-title">{{ $boat->title ?? 'N/A' }}</h1>
                                <p><i class="fas fa-map-marker-alt"></i> {{ $boat->destination->title ?? 'N/A' }}</p>
                                <div class="row">
                                    <div class="col-md-5">
                                        @if ($boat->boatFeature)
                                            @foreach ($boat->boatFeature as $feature)
                                                <span class="badge badge-style"><i class="fa-regular fa-circle-check"></i>
                                                    {{ $feature->title ?? '' }}</span>
                                            @endforeach
                                        @endif

                                    </div>
                                </div>
                            </div>


                            <div class="col-md-3">
                                <div class="reviewsection">
                                    <p class="reviewstar"><i class="fas fa-star"></i>
                                        <span style="color: #16A376">5/5 Very Good</span>
                                        <span style="color: #A7A7A7">(450)</span>
                                    </p>
                                    <small>start from</small>
                                    <p class="amount-style">Tk. {{ number_format((float) $boat->boat_price / 19) ?? '' }}
                                    </p>
                                    <small>per person</small>
                                    <div class="button-group">

                                        <form style="width: 100%"
                                            action="{{ route('boat.front.fullBoatDetails', $boat->slug) }}"
                                            method="GET">
                                            <input type="hidden" name="checking_date" value="{{ $checkingDate }}">
                                            <button class="book-boat-button text-center">Book Boat</button>
                                        </form>
                                        <form class="d-flex justify-content-end" style="width: 100%"
                                            action="{{ route('boat.front.boatDetails', $boat->slug) }}" method="GET">
                                            <input type="hidden" name="checking_date" value="{{ $checkingDate }}">
                                            <input type="hidden" name="checkout_date" value="{{ $checkoutDate }}">
                                            <button class="book-cabin-button">Book Cabin</button>
                                        </form>
                                    </div>
                                </div>

                            </div>


                            <div class="col-md-12 card-footer-style">
                                <div class="row text-white text-center">
                                    <div class="col-md-3 mt-1 mb-1">
                                        {{-- <button class="footer-button-style">
                                            Available For Booking
                                        </button> --}}
                                    </div>
                                    <div class="col-md-3 mt-1 mb-1"
                                        style="display: flex;justify-content: center; align-items: center;">
                                        <button class="footer-button-style boatInfo"
                                            boat-details="{{ $boat->long_description ?? 'N/A' }}"
                                            boat-map="{{ $boat->map_link ?? 'N/A' }}"
                                            food-menu="{{ $boat->food_menu ?? 'N/A' }}"
                                            restriction="{{ $boat->restriction ?? 'N/A' }}"
                                            smokingRule = "{{ $boat->smoking_rule ?? 'N/A' }}"
                                            pet-policy= "{{ $boat->pets_policy ?? 'N/A' }}"
                                            child-policy = "{{ $boat->child_policy ?? 'N/A' }}"
                                            extra-bed-policy="{{ $boat->extra_bed_policy ?? 'N/A' }}">
                                            <i class="fas fa-info-circle"></i> Boat Info</button>
                                    </div>
                                    <div class="col-md-3 mt-1 mb-1"
                                        style="display: flex;justify-content: center; align-items: center;">
                                        <button class="footer-button-style checkInOutTimeButton"
                                            data-checkInTime= "{{ $boat->check_in_time ?? '' }}"
                                            data-checkOutTime={{ $boat->check_out_time ?? '' }}><i
                                                class="fa-regular fa-circle-check text-xs"></i>
                                            CheckIn-Out</button>
                                    </div>
                                    <div class="col-md-3 mt-1 mb-1"
                                        style="display: flex;justify-content: center; align-items: center;">
                                        <button data-cancelation-policy="{{ $boat->cancelation_policy ?? 'N/A' }}"
                                            class="footer-button-style cancelationPolicyButton"><i
                                                class="fa-regular fa-handshake"></i>
                                            Cancelation
                                            Policy</button>
                                    </div>
                                </div>
                            </div>

                        </div>
                    @endforeach
                @endif
            </div>
        </div>

        <!-- boat details modal-->
        <div class="modal fade" id="bootInfoModal" tabindex="-1" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" style="max-width: 90%; max-height: 100%">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Full Boat Details</h5>
                        <button style="background: lightgray;border: none; border-radius: 20px;" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">x</button>
                    </div>
                    <div class="modal-body">
                        <div class="d-flex justify-content-center">
                            <div class="col-md-12 mt-20">

                                <div class="tab-regular">
                                    <ul class="nav nav-tabs " id="myTab" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="boatdetails-tab" data-toggle="tab"
                                                href="#boatdetails" role="tab" aria-controls="boatdetails"
                                                aria-selected="true">Boat Details</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="boatMap-tab" data-toggle="tab" href="#boatMap"
                                                role="tab" aria-controls="boatMap" aria-selected="false">Boat Map</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="foodMenu-tab" data-toggle="tab" href="#foodMenu"
                                                role="tab" aria-controls="foodMenu" aria-selected="false">Resturant
                                                Food Menu
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="restriction-tab" data-toggle="tab"
                                                href="#restriction" role="tab" aria-controls="restriction"
                                                aria-selected="false">Restriction</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="somokingrule-tab" data-toggle="tab"
                                                href="#somokingrule" role="tab" aria-controls="somokingrule"
                                                aria-selected="false">Smoking/Alcohol Consumption Rules
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="petPolicy-tab" data-toggle="tab" href="#petPolicy"
                                                role="tab" aria-controls="petPolicy" aria-selected="false">Pets
                                                Policy
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="childPolicy-tab" data-toggle="tab"
                                                href="#childPolicy" role="tab" aria-controls="childPolicy"
                                                aria-selected="false">Child Policy
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="extraBedPolicy-tab" data-toggle="tab"
                                                href="#extraBedPolicy" role="tab" aria-controls="extraBedPolicy"
                                                aria-selected="false">Extra Bed Policy
                                            </a>
                                        </li>
                                    </ul>
                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade show active" id="boatdetails" role="tabpanel"
                                            aria-labelledby="boatdetails-tab">
                                            <div class="boatDetailsDescription">

                                            </div>

                                        </div>
                                        <div class="tab-pane fade" id="boatMap" role="tabpanel"
                                            aria-labelledby="boatMap-tab">
                                            <div class="boatMapDescription">

                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="foodMenu" role="tabpanel"
                                            aria-labelledby="foodMenu-tab">
                                            <div class="boatFoodMenuDescription">

                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="restriction" role="tabpanel"
                                            aria-labelledby="restriction-tab">
                                            <div class="boatRestrictionDescription">

                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="somokingrule" role="tabpanel"
                                            aria-labelledby="somokingrule-tab">
                                            <div class="boatSmokingDescription">

                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="petPolicy" role="tabpanel"
                                            aria-labelledby="petPolicy-tab">
                                            <div class="boatPetPolicyDescription">

                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="childPolicy" role="tabpanel"
                                            aria-labelledby="childPolicy-tab">
                                            <div class="childPolicyDescription">

                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="extraBedPolicy" role="tabpanel"
                                            aria-labelledby="extraBedPolicy-tab">
                                            <div class="extraBedPolicyDescription">

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>


    <!--check in out modal modal-->
    <div class="modal fade" id="checkInOutTimeModal" tabindex="-1" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header text-black">
                    <h5 class="modal-title" id="exampleModalLabel">Check In/Out Time</h5>
                    <button type="button" class="btn-cabin-close border-0 rounded-circle" data-bs-dismiss="modal"
                        aria-label="Close">x</button>
                </div>
                <div class="modal-body">
                    <table class="table">
                        <tr>
                            <td>Check In Time: </td>
                            <td class="checkInTimeIntoModal"></td>
                        </tr>
                        <tr>
                            <td>Check Out Time: </td>
                            <td class="checkOutTimeIntoModal"></td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-cabin-close"
                        data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!---cancelation policy modal--->
    <div class="modal fade" id="cancelationPolicyModal" tabindex="-1" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header text-black">
                    <h5 class="modal-title" id="exampleModalLabel">Cancelation Policy</h5>
                    <button type="button" class="btn-cancelation-close border-0 rounded-circle" data-bs-dismiss="modal"
                        aria-label="Close">x</button>
                </div>
                <div class="modal-body">
                    <div class="cancelationPolicyText">

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-cancelation-close"
                        data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
@endsection

@push('js')
    <script>
        // for book info
        $(document).on("click", ".boatInfo", function() {
            console.log("book boat button clicked");
            let boatDetails = $(this).attr('boat-details');
            let boatMap = $(this).attr('boat-map');
            let foodMenu = $(this).attr('food-menu');
            let restriction = $(this).attr('restriction');
            let smokingRule = $(this).attr('smokingRule');
            let petPolicy = $(this).attr('pet-policy');
            let childPolicy = $(this).attr('child-policy');
            let extraBedPolicy = $(this).attr('extra-bed-policy');
            // console.log(boatDetails,boatMap,foodMenu,restriction,smokingRule,petPolicy,childPolicy,extraBedPolicy);
            $(".boatDetailsDescription").html(boatDetails);
            $(".boatMapDescription").html(boatMap);
            $(".boatFoodMenuDescription").html(foodMenu);
            $(".boatRestrictionDescription").html(restriction);
            $(".boatSmokingDescription").html(smokingRule);
            $(".boatPetPolicyDescription").html(petPolicy);
            $(".childPolicyDescription").html(childPolicy);
            $(".extraBedPolicyDescription").html(extraBedPolicy);
            $("#bootInfoModal").modal('show');
        })

        $(document).on("click", ".btn-close", function() {
            $("#bootInfoModal").modal('hide');
        })


        // for check in out time

        $(document).on("click", ".checkInOutTimeButton", function() {
            console.log("boat checkin and out button clicked");
            let checkInTime = $(this).attr('data-checkInTime');
            let checkOutTime = $(this).attr('data-checkOutTime');

            function formatTimeTo12Hour(time) {
                let [hours, minutes] = time.split(':');
                let period = 'AM';

                hours = parseInt(hours, 10);
                if (hours >= 12) {
                    period = 'PM';
                    if (hours > 12) hours -= 12;
                } else if (hours === 0) {
                    hours = 12;
                }
                return `${hours}:${minutes} ${period}`;
            }

            let formattedCheckInTime = formatTimeTo12Hour(checkInTime);
            let formattedCheckOutTime = formatTimeTo12Hour(checkOutTime);

            $('.checkInTimeIntoModal').text(formattedCheckInTime ?? 'not set check in time');
            $('.checkOutTimeIntoModal').text(formattedCheckOutTime ?? 'not set check out time');
            console.log("Formatted check in time and check out time", formattedCheckInTime, formattedCheckOutTime);

            $("#checkInOutTimeModal").modal('show');
        });
        $(document).on("click", ".btn-cabin-close", function() {
            $("#checkInOutTimeModal").modal('hide');
        })


        // for cancelation policy
        $(document).on("click", ".cancelationPolicyButton", function() {
            let cancelationPolicy = $(this).attr('data-cancelation-policy');
            console.log('cancelation policy text', cancelationPolicy);
            $(".cancelationPolicyText").html(cancelationPolicy);
            $("#cancelationPolicyModal").modal('show');
        })

        $(document).on("click", ".btn-cancelation-close", function() {
            $("#cancelationPolicyModal").modal('hide');
        })







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
        })
    </script>

    <!-- owl carousel -->
    <script>
        $(document).ready(function() {
            $(".owl-carousel").owlCarousel({
                loop: true,
                margin: 10,
                stagePadding: 5,
                dots: false,
                nav: true, // Enable navigation arrows
                navText: [
                    "<div class='owl-prev'>&lt;</div>", // Custom previous arrow
                    "<div class='owl-next'>&gt;</div>" // Custom next arrow
                ],
                responsive: {
                    0: {
                        items: 1
                    },
                    600: {
                        items: 1
                    },
                    1000: {
                        items: 1
                    }
                }
            });
        });
    </script>
@endpush
