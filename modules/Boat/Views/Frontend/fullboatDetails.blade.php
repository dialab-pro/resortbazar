@extends('layouts.app')
@section('content')
    <div class="container mt-5">
        <!--date range search--->

        <div class="row">
            <div class="col-md-12 text-center mb-3">
                {{-- @dd($checkingDate, $checkoutDate); --}}
                <p style="font-size: larger; font-weight: bold; color: gray;">
                    <span id="startDate">{{ $checkingDate ?? '' }}</span> to
                    <span id="endDate">{{ $checkoutDate ?? '' }}</span>
                </p>

                <!-- Hidden Input Field -->
                <input type="text" id="daterangeInput" class="form-control has-daterangepicker"
                    style="display: none; width: 50%; margin: auto; text-align: center; border: 1px solid lightgray; border-radius: 50px; margin-bottom: 15px;">

                <!-- Buttons -->
                <div style="text-align: center; margin-top: 15px;">
                    <button style="border: none; background: #00AEEF; color: white; padding: 5px 20px; margin: 0 auto;"
                        id="previousBtn">Previous</button>
                    <button style="border: none; background: #00AEEF; color: white; padding: 5px 20px; margin: 0 auto;"
                        id="nextBtn">Next</button>
                    <button style="border: none; background: #00AEEF; color: white; padding: 5px 20px; margin: 0 auto;"
                        id="changeBtn">Change</button>
                </div>

            </div>
        </div>
    </div>
    <!-- Cabin Cards Section -->
    <section class="container shadow p-3 mb-5 bg-body rounded" style="">

        <div class="row">
            <div class="col-md-4">
                <div id="checkAvailabilityCarousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        @php
                            $images = json_decode($boat->image);
                        @endphp
                        @foreach ($images as $index => $image)
                            <div class="carousel-item {{ $loop->first ? 'active' : '' }}">
                                <img class="d-block w-100" src="{{ asset($image ?? '') }}" alt="Slide {{ $index + 1 }}">
                            </div>
                        @endforeach
                    </div>

                    <a class="carousel-control-prev" href="#checkAvailabilityCarousel" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#checkAvailabilityCarousel" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="col-md-5">
                <div class="p-1">
                    <p class="" style="font-size: large;font-weight: 600;color: #173C6C">{{ $boat->title ?? '' }}</p>
                    <!---location --->
                    <small><i class="fas fa-map-marker-alt"></i> {{ $boat->destination->title ?? 'N/A' }}</small>

                    <!-- feature shape -->
                    <div style="color: #173C6C;" class="d-flex align-items-center">
                        @if ($boat->boatFeature)
                            @foreach ($boat->boatFeature as $feature)
                                <div class="mr-1">
                                    <i class="fa-regular fa-circle-check text-xs"></i>
                                    <small style="font-weight: bold">{{ $feature->title ?? 'N/A' }}</small>
                                </div>
                            @endforeach
                        @else
                            <p>no boat feature</p>
                        @endif

                    </div>
                    <!---table-->
                    <table class="table table-striped mt-2">
                        <thead style="background-color: #173C6C; color: white; text-align: left">
                            <tr>
                                <td class="text-center" style="font-weight: bold">Persons</td>
                                <td class="text-center" style="font-weight: bold">Per Person Rate</td>
                                <td class="text-center">-</td>
                            </tr>
                        </thead>
                        @php
                            $boatPersonDateRange = json_decode($boat->boat_persons_price);
                            $lastData = end($boatPersonDateRange);
                            $firstData = reset($boatPersonDateRange);
                            $firstRange = explode('-', $firstData->person_range);
                            $lastRange = explode('-', $lastData->person_range);
                            $firstPrice = $firstData->price;
                            $lastPrice = $lastData->price;
                            $lastMaxPerson = $lastRange[1];
                            $firstMinPerson = $firstRange[0];
                            // dd($boatPersonDateRange,$lastData,$lastRange,$lastPrice,$firstMinPerson);
                        @endphp
                        <input type="hidden" name="" class="firstPerson" value="{{ $firstMinPerson ?? 0 }}">
                        <input type="hidden" name="" class="lastPerson" value="{{ $lastMaxPerson ?? 0 }}">
                        <input type="hidden" name="" class="lastAmount" value="{{ $lastPrice ?? 0 }}">
                        <tbody>
                            @foreach ($boatPersonDateRange as $range)
                                @php
                                    $rangeDivide = explode('-', $range->person_range);
                                @endphp
                                <tr>
                                    <td class="text-center">{{ $range->person_range ?? 'N/A' }}</td>
                                    <td class="text-center">TK.
                                        {{ $range->person_range ? number_format($range->price) : 0 }}</td>
                                    <td class="text-center">
                                        <button class="selectPersonButton rangePersonButton" data-person="{{ $rangeDivide[0] }}"
                                            data-personlast="{{ $rangeDivide[1] }}"
                                            data-price="{{ $range->person_range ? $range->price : 0 }}"
                                            style="border: none; background: #00AEEF; color: white; padding: 5px 20px; margin: 0 auto;">
                                            select
                                        </button>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>

                    </table>

                    <input type="hidden" class="boatPriceHiddenField" value="{{ $boat->boat_price ?? '0' }}">
                </div>
            </div>



            <div class="col-md-3">
                <div class="mt-4" style="text-align: right">
                    <p style="color: #EAB308;font-weight: 600;margin-bottom: 0;"><i class="fas fa-star"></i> <span
                            style="color: #16A376">5/5 Very Good</span> <span style="color: #A7A7A7">(450)</span></p>

                    <p style="font-weight: 800; color: #173C6C;font-size: large">Tk.
                        {{ $boat->boat_price ? number_format($firstPrice) : 0 }} to Tk.
                        {{ $boat->boat_price ? number_format($lastPrice) : 0 }}</p>
                    @php
                        $boatSchedule = $boat->boatSchedule;
                        $isSchedule = false;
                        $desiredCheckingDate = $checkingDate;
                        $availity = false;
                        $boatScheduleSingle = $boat->boatSchedule()->where('check_in_date', $checkingDate)->first();

                        if ($boatSchedule) {
                            foreach ($boatSchedule as $schedule) {
                                // Check if 'is_schedule' is true and 'checking_date' matches the desired date
                                if ($schedule->check_in_date == $desiredCheckingDate) {
                                    $isSchedule = true;
                                    break;
                                }
                            }
                            if ($isSchedule) {
                                $boatCabinIds = $boat->boatCabin->pluck('id');
                                $boatBooked = \Modules\Boat\Models\BoatBooking::where('boat_id', $boat->id)
                                    ->where('booked_date', $checkingDate)
                                    ->first();

                                if ($boatBooked) {
                                    $bookedCabin = $boatBooked
                                        ->boatBookingCabin()
                                        ->whereIn('cabin_id', $boatCabinIds)
                                        ->count();
                                    // dd($bookedCabin);
                                    if ($bookedCabin <= 0) {
                                        $availity = true;
                                    } else {
                                        $availity = false;
                                    }
                                } else {
                                    $availity = true;
                                }

                                // dd($boatCabinIds, $boatBooked);
                            }
                        }
                    @endphp


                    @if ($isSchedule && $availity)
                        <button class="selectPersonButton" data-person="{{ $firstMinPerson ?? 0 }}"
                            data-price="{{ $boat->boat_price ? $firstPrice : 0 }}"
                            style="border: none; background: #00aeef; color: white; padding: 2px 20px; margin: 0 auto;">
                            select
                        </button>
                    @endif
                    @if (!$availity)
                        <p style="color: red;">This boat is not avaialable for booked.</p>
                    @endif

                </div>

                @if ($isSchedule && $availity)
                    <form action="{{ route('boat.front.boatBooking') }}" method="POST">
                        @csrf
                        <div class="row">
                            <div class="col-md-12">
                                <label for=""
                                    style="font-size: 10px; font-weight:bold; text-decoration: none; color: #5F799F; font-style: italic; ">
                                    <i class="fas fa-calendar-check"></i> Check-in Date</label>
                                <br>
                                <b>{{ $boatScheduleSingle->check_in_date ?? '' }}</b>
                            </div>
                            <div class="col-md-12">
                                <label for=""
                                    style="font-size: 10px; font-weight:bold; text-decoration: none; color: #5F799F; font-style: italic; ">
                                    <i class="fas fa-calendar-minus"></i> Check-out Date</label>
                                <br>
                                <b>{{ $boatScheduleSingle->check_out_date ?? '' }}</b>
                            </div>
                            <div class="col-md-12">
                                <label for=""
                                    style="font-size: 13px; font-weight:bold; text-decoration: none; color: #5F799F; font-style: italic; ">
                                    <i class="fas fa-users"></i> Persons</label>
                                <br>
                                <input type="number" id="person" name="person" class="form-control personField"
                                    required>
                            </div>
                            <div class="col-md-12">
                                <label for=""
                                    style="font-size: 13px; font-weight:bold; text-decoration: none; color: #5F799F; font-style: italic; ">
                                    <i class="fas fa-donate"></i> Rate</label>
                                <br>
                                <input type="text" name="person_rate" id="per_person_rate"
                                    class="form-control personRateField" required>
                            </div>
                            <div class="col-md-12">
                                <label for=""
                                    style="font-size: 13px; font-weight:bold; text-decoration: none; color: #5F799F; font-style: italic; ">
                                    <i class="fas fa-balance-scale"></i> Total</label>
                                <br>
                                <input type="text" name="total" readonly="" id="total_rate"
                                    class="form-control totalPriceField" required>
                            </div>
                            <div class="col-md-12"> <br>
                                <input type="hidden" name="boat_id" value="{{ $boat->id }}">
                                <input type="hidden" name="booked_date" value="{{ $checkingDate }}">
                                <button class="btn btn-primary w-100">Book Now</button>
                            </div>
                        </div>
                    </form>
                @endif
            </div>
        </div>




    </section>


    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
@endsection

@push('js')
    <script>
        $(document).on("click", ".selectPersonButton", function() {
            let person = $(this).attr('data-person');
            let price = parseFloat($(this).attr('data-price')) || 0;
            let total = person * price;
            console.log(person, price.toFixed(), total.toFixed(2));
            totalCalculation(person, price, total);

        })

        $(document).on("change", ".personField", function() {
            let person = $(this).val();
            let minPerson = parseInt($('.firstPerson').val()) || 0;
            let lastPerson = parseInt($(".lastPerson").val()) || 0;
            let lastAmount = parseFloat($(".lastAmount").val()) || 0;
            person = Math.max(person, minPerson);
            $(this).val(person);

            let matchedPrice = 0;


            $(".rangePersonButton").each(function() {
                let minPersonRange = parseInt($(this).attr('data-person')) || 0;
                let maxPersonRange = parseInt($(this).attr('data-personlast')) || 0;
                let price = parseFloat($(this).data('price')) || 0;

                if (person >= minPersonRange && person <= maxPersonRange) {
                    matchedPrice = price;
                }
                console.log('min and max personRange',minPersonRange,maxPersonRange)
            });

            if (matchedPrice > 0) {
                console.log("match price er vitore");
                let price = matchedPrice;
                let totalPrice = price * person;
                totalCalculation(person, price, totalPrice);
            } else {
                console.log("match price er vitore na");
                let price = person > lastPerson ? lastAmount : matchedPrice;
                let totalPrice = price * person;
                totalCalculation(person, price, totalPrice);
            }
        })


        function totalCalculation(person, price, total) {
            $(".personField").val(person);
            $(".personRateField").val(price.toFixed(2));
            $(".totalPriceField").val(total.toFixed(2));


        }



        // date range
        $('.has-daterangepicker').daterangepicker();
        $('.has-daterangepicker').on('apply.daterangepicker', function(ev, picker) {
            // $(".checkingDate").empty();
            // $(".checkingDate").append(`<p>Selected Checking Date: ${picker.startDate.format('YYYY-MM-DD')}</p>`);
            // $(".checkInDate").val(picker.startDate.format('YYYY-MM-DD'));
            console.log(picker.startDate.format('DD/MM/YYYY'));
            console.log(picker.endDate.format('DD/MM/YYYY'));

            $("#startDate").text(picker.startDate.format('DD/MM/YYYY'));
            $("#endDate").text(picker.endDate.format('DD/MM/YYYY'));
            // let newSearchParams = new URLSearchParams(window.location.search);
            // newSearchParams.set('checking_date', picker.startDate.format('YYYY-MM-DD'));
            // window.location.search = newSearchParams.toString();
        });



        // next update
        $(document).ready(function() {
            let startDate = $('#startDate').text() ? moment($('#startDate').text(), 'YYYY-MM-DD') : moment()
                .subtract(7, 'days');
            let endDate = $("#endDate").text() ? moment($("#endDate").text(), 'YYYY-MM-DD') : moment();

            updateDateDisplay();


            $('#daterangeInput').daterangepicker({
                startDate: startDate,
                endDate: endDate,
                autoUpdateInput: false,
                opens: 'center'
            }, function(start, end) {
                startDate = start;
                endDate = end;
                updateDateDisplay();
                let newSearchParams = new URLSearchParams(window.location.search);
                newSearchParams.set('checking_date', startDate.format('YYYY-MM-DD'));
                newSearchParams.set('checkout_date', endDate.format('YYYY-MM-DD'));
                window.location.search = newSearchParams.toString();

            });

            // "Previous" button click - go to the previous date range
            $('#previousBtn').on('click', function() {
                startDate = startDate.subtract(1, 'days');
                endDate = endDate.subtract(1, 'days');
                updateDateDisplay();
                let newSearchParams = new URLSearchParams(window.location.search);
                newSearchParams.set('checking_date', startDate.format('YYYY-MM-DD'));
                newSearchParams.set('checkout_date', endDate.format('YYYY-MM-DD'));
                window.location.search = newSearchParams.toString();
            });

            // "Next" button click - go to the next date range
            $('#nextBtn').on('click', function() {
                startDate = startDate.add(1, 'days');
                endDate = endDate.add(1, 'days');
                updateDateDisplay();
                let newSearchParams = new URLSearchParams(window.location.search);
                newSearchParams.set('checking_date', startDate.format('YYYY-MM-DD'));
                newSearchParams.set('checkout_date', endDate.format('YYYY-MM-DD'));
                window.location.search = newSearchParams.toString();
            });

            // "Change" button click - show the DateRangePicker
            $('#changeBtn').on('click', function() {
                $('#daterangeInput').data('daterangepicker')
                    .show();
            });

            // Function to update the displayed start and end dates
            function updateDateDisplay() {
                $('#startDate').text(startDate.format('YYYY-MM-DD'));
                $('#endDate').text(endDate.format('YYYY-MM-DD'));
                console.log("inside update data displaay functionm", startDate.format('YYYY-MM-DD'), endDate.format(
                    'YYYY-MM-DD'));

            }
        });
    </script>
@endpush
