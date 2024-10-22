@extends('admin.layouts.app')

@section('content')
    <style>
        .step {
            display: none;
        }

        .step.active {
            display: block;
        }

        /* Step indicator style */
        .step-indicator {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
            z-index: 1;
        }

        .step-indicator .step-number {
            width: 40px;
            height: 40px;
            background-color: #ddd;
            color: #fff;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 16px;
        }

        .step-indicator .step-number.active {
            background-color: #007bff;
        }

        .step-indicator .step-label {
            font-size: 14px;
            margin-top: 8px;
            text-align: center;
        }

        .step-indicator div {
            flex: 1;
            text-align: center;
        }

        /* Progress line */
        .step-indicator::before {
            content: '';
            position: absolute;
            top: 20px;
            left: 0;
            right: 0;
            height: 4px;
            background-color: #ddd;
            z-index: -1;
        }

        .step-indicator div.active~div .step-number {
            background-color: #ddd !important;
        }
    </style>
    <div class="container-fluid">
        <div class="d-flex justify-content-between mb20">
            <h1 class="title-bar">Boat Create</h1>
            <div class="title-actions">

                <a href="{{ route('boat.admin.index') }}" class="btn btn-primary">{{ __('View Boats') }}</a>

            </div>
        </div>
        @include('admin.message')

        <div>
            <div class="panel">
                <div class="panel-body">
                    <form action="{{ route('boat.admin.store') }}" class="bravo-form-item" method="POST"
                        enctype="multipart/form-data">
                        @csrf

                        <!--step by step design-->
                        <div class="container mt-5">
                            <!-- Progress Indicator -->
                            <div class="step-indicator position-relative">
                                <div class="text-center">
                                    <div class="step-number active">1</div>
                                    <div class="step-label">Basic Info</div>
                                </div>
                                <div class="text-center">
                                    <div class="step-number">2</div>
                                    <div class="step-label">Description Info</div>
                                </div>

                                <div class="text-center">
                                    <div class="step-number">3</div>
                                    <div class="step-label">Cabin Info</div>
                                </div>

                                <div class="text-center">
                                    <div class="step-number">4</div>
                                    <div class="step-label">Feature Info</div>
                                </div>

                                <div class="text-center">
                                    <div class="step-number">5</div>
                                    <div class="step-label">Schedule Info</div>
                                </div>
                            </div>

                            <form id="multiStepForm">
                                <!-- Step 1 -->
                                <div class="step active">
                                    <h4>Step 1: Basic Info</h4>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label for="" class="form-label">Select Destination</label>
                                            {{-- @dd($destinations); --}}
                                            <select name="destination_id" class="form-control destinationSelect"
                                                id="">
                                                <option selected disable class="select-option">Select Destination</option>
                                                @foreach ($destinations as $destination)
                                                    <option value="{{ $destination->id }}">{{ $destination->title }}
                                                    </option>
                                                @endforeach
                                            </select>
                                            <span id="destinationErrors" style="color:red;"></span>
                                        </div>

                                        <div class="col-md-4 mb-2">
                                            <label for="" class="form-label">Boat Title</label>
                                            <input type="text" name="title" class="form-control boatTitle"
                                                placeholder="please enter your title">
                                            <span id="boatTitleErrors" style="color:red;"></span>
                                        </div>

                                        <div class="col-md-4 mb-2">
                                            <label for="" class="form-label">Boat Slug</label>
                                            <input type="text" name="slug" class="form-control boatSlug" readonly
                                                placeholder="slug">
                                        </div>
                                        <div class="col-md-4 mb-2">
                                            <label for="" class="form-label">Full Boat Price</label>
                                            <input type="number" step="any" class="form-control fullBoatPrice"
                                                name="boat_price" placeholder="Enter Boat Price">
                                            <span id="fullboatPriceErrors" style="color:red;"></span>
                                        </div>
                                        <div class="col-md-4 mb-2">
                                            <label for="" class="form-label">Percentage of Payment Booking</label>
                                            <input type="number" class="form-control percentageOfPayment"
                                                name="booking_percentage">
                                            <span id="bookiPercentageErrors" style="color:red;"></span>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group m-auto">
                                                <input class="status" type="checkbox" name="status" data-toggle="toggle"
                                                    value="1">
                                                <label for="" class="form-label">status</label>
                                            </div>
                                            <span id="statusError" style="color:red;"></span>
                                        </div>

                                        <hr>

                                        <div class="col-md-4 mb-2">
                                            <label for="boat-image" class="form-label">Boat Image</label>
                                            <input type="file" name="image[]" id="boat-image"
                                                class="form-control boatImages" multiple accept="image/*">
                                            <small class="text-danger">Image size will be 450x400 px</small>
                                            <div id="boat-image-previews" class="mt-2"></div>
                                            <span id="imageError" style="color:red;"></span>
                                        </div>

                                        <div class="col-md-4 mb-2">
                                            <label for="boat-banner-image" class="form-label">Boat Banner Image</label>
                                            <input type="file" name="banner_image" id="boat-banner-image"
                                                class="form-control boatBannerImage" accept="image/*">
                                            <small class="text-danger">Image size will be 1920x600 px</small>
                                            <div id="boat-banner-preview-container" class="mt-2">
                                                <img id="boat-banner-preview" src="" alt="Boat Banner Preview"
                                                    style="display: none; max-width: 100%; height: auto;" />
                                            </div>
                                            <span id="bannerImageError" style="color:red;"></span>
                                        </div>

                                    </div>
                                    <button type="button" class="btn btn-primary nextBtn first_step_next mt-3"
                                        disabled>Next</button>
                                </div>

                                <!-- Step 2 -->
                                <div class="step">
                                    <h4>Step 2: Description Info</h4>

                                    <div class="row">
                                        <div class="col-md-6 mb-2">
                                            <label for="" class="form-label">Short Description</label>
                                            <textarea class="form-control shortDescription" name="short_description" id="" cols="30"
                                                rows="10"></textarea>
                                            <span id="shortDescriptionError" style="color:red;"></span>
                                        </div>

                                        <div class="col-md-6 mb-2">
                                            <label for="" class="form-label">Map (embaded link)</label>
                                            <textarea name="map_link" id="" class="form-control mapLink" cols="30" rows="10"></textarea>
                                            <span id="mapLinkError" style="color:red;"></span>
                                        </div>
                                        <div class="col-md-6 mb-2">
                                            <label for="" class="form-label">Boat Description</label>
                                            <textarea name="long_description" id="longDescription" class=" has-ckeditor longDescription" cols="30"
                                                rows="10"></textarea>
                                            <span id="longDescriptionError" style="color:red;"></span>
                                        </div>
                                        <div class="col-md-6 mb-2">
                                            <label for="" class="form-label">Food Menu (Resturant)</label>
                                            <textarea name="food_menu" id="" class="form-control has-ckeditor foodMenu" cols="30" rows="10"></textarea>
                                            <span id="foodMenuError" style="color:red;"></span>
                                        </div>

                                        <div class="col-md-6 mb-2">
                                            <label for="" class="form-label">Restriction </label>
                                            <textarea name="restriction" id="" cols="30" rows="10"
                                                class="form-control has-ckeditor restriction"></textarea>
                                            <span id="restrictionError" style="color:red;"></span>
                                        </div>

                                        <div class="col-md-6 mb-2">
                                            <label for="" class="form-label">Smoking / Alcohol Consumption
                                                Rules</label>
                                            <textarea name="smoking_rule" class="form-control has-ckeditor smokingRule" id="" cols="30"
                                                rows="10"></textarea>
                                            <span id="smokingRuleError" style="color:red;"></span>
                                        </div>

                                        <div class="col-md-6 mb-2">
                                            <label for="" class="form-label">Pets Policy</label>
                                            <textarea name="pets_policy" class="form-control has-ckeditor petsPolicy" id="" cols="30"
                                                rows="10"></textarea>
                                            <span id="petsError" style="color:red;"></span>
                                        </div>

                                        <div class="col-md-6 mb-2">
                                            <label for="" class="form-label">Child Policy</label>
                                            <textarea name="child_policy" class="form-control has-ckeditor childPolicy" id="" cols="30"
                                                rows="10"></textarea>
                                            <span id="childPolicyError" style="color:red;"></span>
                                        </div>

                                        <div class="col-md-6 mb-2">
                                            <label for="" class="form-label">Extra Bed Policy</label>
                                            <textarea name="extra_bed_policy" class="form-control has-ckeditor extraBedPolicy" id="" cols="30"
                                                rows="10"></textarea>
                                            <span id="extraBedPolicyError" style="color:red;"></span>
                                        </div>

                                        <div class="col-md-6 mb-2">
                                            <label for="" class="form-label">Cancelation Policy</label>
                                            <textarea name="cancelation_policy" class="form-control has-ckeditor cancelationPolicy" id=""
                                                cols="30" rows="10"></textarea>
                                            <span id="cencelationPolicyError" style="color:red;"></span>
                                        </div>


                                    </div>
                                    <button type="button" class="btn btn-secondary prevBtn">Previous</button>
                                    <button type="button" class="btn btn-primary nextBtn second_step_next">Next</button>
                                </div>

                                <!-- Step 3 -->
                                <div class="step">
                                    <h4>Step 3: Cabin Info</h4>

                                    <div class="cabinList">
                                        <div class="row cabin_1">
                                            <div class="col-md-12">
                                                <hr>
                                                <div class="d-flex justify-content-between">
                                                    <h5>Cabin 1</h5>
                                                    <button type="button" class="btn btn-primary addCabin"
                                                        data-index="1">Add Cabin +</button>
                                                </div>
                                                <hr>
                                            </div>
                                            <div class="col-md-4 mb-2">
                                                <label for="" class="form-label">Cabin Title</label>
                                                <input type="text" name="cabin_title[1]"
                                                    class="form-control boatCabinTitle" data-id="1"
                                                    placeholder="please enter your title">
                                            </div>
                                            <div class="col-md-4 mb-2">
                                                <label for="" class="form-label">Cabin Slug</label>
                                                <input type="text" name="cabin_slug[1]"
                                                    class="form-control boatCabinSlug_1 cabinSlug" readonly placeholder="slug">
                                            </div>

                                            <div class="col-md-4 mb-2">
                                                <label for="" class="form-label">Cabin Type </label>
                                                <input type="text" name="cabin_type[1]" class="form-control cabinType"
                                                    placeholder="eg: deluxe,standard">
                                            </div>
                                            <div class="col-md-4 mb-2">
                                                <label for="" class="form-label">Cabin Price </label>
                                                <input type="text" name="cabin_price[1]" class="form-control cabinPrice"
                                                    placeholder="Price">
                                            </div>

                                            <div class="col-md-4 mb-2">
                                                <label for="" class="form-label">Person (How many person of this
                                                    Cabin)</label>
                                                <input type="text" name="cabin_person[1]" class="form-control cabinPerson"
                                                    placeholder="How many person of this Cabin">
                                            </div>
                                            <div class="col-md-4 mb-2">
                                                <label for="" class="form-label">Extra Person Fee</label>
                                                <input type="text" class="form-control cabinExtraPerson"
                                                    name="cabin_extra_person_fee[1]" placeholder="Extra Person Fee">
                                            </div>

                                            <hr>
                                            <div class="col-md-4 mb-2">
                                                <label for="cabin-image" class="form-label">Cabin Image</label>
                                                <input type="file" name="cabin_image[1][]" id="cabin-image"
                                                    data-index="1" class="form-control cabinImage" multiple accept="image/*">
                                                <small class="text-danger">Image size will be 400x400 px</small>
                                                <div id="cabin-image-previews_1" class="mt-2"></div>
                                            </div>
                                            <div class="col-md-6 mb-1">
                                                <div class="row cabin_1">
                                                    <div class="col-10 col-md-11">
                                                        <div class="cabinFeature">
                                                            <div class="form-group">
                                                                <label for="" class="form-label">Cabin
                                                                    Feature</label>
                                                                <input type="text" name="cabin_feature[1][]"
                                                                    class="form-control cabinFeature">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-2 col-md-1 cabinFeatureButtonGroup">
                                                        <button type="button" style="margin-top: 28px"
                                                            class="btn btn-primary cabinFeatureAdd" data-row="1"
                                                            data-index="1">+</button>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <button type="button" class="btn btn-secondary prevBtn">Previous</button>
                                    <button type="button" class="btn btn-primary nextBtn" disabled>Next</button>
                                </div>
                                <!-- Step 4 -->
                                <div class="step">
                                    <h4>Step 4: Feature Info</h4>
                                    <hr>
                                    <div class="row">


                                        <div class="col-md-6 mb-1">
                                            <h5>Boat Feature</h5>
                                            <div class="row">
                                                <div class="col-10 col-md-11">
                                                    <div class="boatFeature">
                                                        <div class="form-group">
                                                            <label for="" class="form-label">Boat Feature</label>
                                                            <input type="text" name="boat_feature[]"
                                                                class="form-control">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-2 col-md-1 boatFeatureButtonGroup">
                                                    <button type="button" style="margin-top: 28px"
                                                        class="btn btn-primary boatFeatureAdd" data-index="1">+</button>
                                                </div>
                                            </div>
                                        </div>
                                        {{-- <div class="col-md-6 mb-1">
                                            <h5>Cabin Feature</h5>
                                            <div class="row">
                                                <div class="col-10 col-md-11">
                                                    <div class="cabinFeature">
                                                        <div class="form-group">
                                                            <label for="" class="form-label">Cabin Feature</label>
                                                            <input type="text" name="cabin_feature[]"
                                                                class="form-control">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-2 col-md-1 cabinFeatureButtonGroup">
                                                    <button type="button" style="margin-top: 28px"
                                                        class="btn btn-primary cabinFeatureAdd" data-index="1">+</button>
                                                </div>
                                            </div>
                                        </div> --}}
                                    </div>
                                    <button type="button" class="btn btn-secondary prevBtn">Previous</button>
                                    <button type="button" class="btn btn-primary nextBtn">Next</button>
                                </div>
                                <!-- Step 5 -->
                                <div class="step">
                                    <h4>Step 5: Schedule Info</h4>
                                    <div class="row">

                                        <div class="col-md-6 my-2">
                                            <label for="" class="form-label">Check In Time</label>
                                            <input type="time" class="from-control" name="check_in_time">
                                        </div>
                                        <div class="col-md-6 my-2">
                                            <label for="" class="form-label">Check Out Time</label>
                                            <input type="time" class="from-control" name="check_out_time">
                                        </div>

                                    </div>
                                    <hr>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <h5>30 Days of Boat Schedule</h5>
                                            <div class="checkInOutDateList">
                                                <div class="row">
                                                    <div class="col-md-5">
                                                        <label for="" class="form-label">Check In Date 1</label>
                                                        <input type="date" class="form-control" name="check_in_date[]"
                                                            value="" required>
                                                    </div>
                                                    <div class="col-md-5">
                                                        <label for="" class="form-label">Check Out Date 1</label>
                                                        <input type="date" class="form-control"
                                                            name="check_out_date[]" value="" required>

                                                    </div>
                                                    <div class="col-md-2">
                                                        <button type="button" style="margin-top: 28px"
                                                            class="btn btn-primary addCheckInOut"
                                                            data-index="1">+</button>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="col-md-6">
                                            <h5>Person Wise Price</h5>
                                            <div class="personWisePriceList">
                                                <div class="row">
                                                    <div class="col-md-5">
                                                        <label for="" class="form-label">Person</label>
                                                        <input type="text" class="form-control" name="boat_person[]"
                                                            value="" required>
                                                    </div>
                                                    <div class="col-md-5">
                                                        <label for="" class="form-label">Price</label>
                                                        <input type="number" step="any" class="form-control"
                                                            name="boat_person_price[]" value="" required>

                                                    </div>
                                                    <div class="col-md-2">
                                                        <button type="button" style="margin-top: 28px"
                                                            class="btn btn-primary personWisePriceAdd"
                                                            data-index="1">+</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <button type="button" class="btn btn-secondary prevBtn mt-4">Previous</button>
                                    <button type="submit" class="btn btn-success mt-4">Submit</button>
                                </div>
                            </form>
                        </div>
                    </form>
                </div>

                <!--step by step design end-->



                </form>

            </div>
        </div>
    </div>
    </div>
@endsection

@push('js')
    <script>
        $(document).on("keyup", ".boatTitle", function() {
            var value = $(this).val();
            var slug = value.toLowerCase().replace(/ /g, '-').replace(/[^\w-]+/g, '');
            $('.boatSlug').val(slug);
        })
        $(document).on("keyup", ".boatCabinTitle", function() {
            var value = $(this).val();
            var index = $(this).attr("data-id");
            var slug = value.toLowerCase().replace(/ /g, '-').replace(/[^\w-]+/g, '');
            $(`.boatCabinSlug_${index}`).val(slug);
        })
    </script>


    <!--step script-->
    <script>
        $(document).ready(function() {
            let currentStep = 0;
            const steps = $('.step');
            const stepNumbers = $('.step-number');

            // Function to show the correct step and update progress
            function showStep(stepIndex) {
                steps.removeClass('active');
                stepNumbers.removeClass('active');
                $(steps[stepIndex]).addClass('active');
                $(stepNumbers[stepIndex]).addClass('active');
            }

            // Handle Next button click
            $('.nextBtn').on('click', function() {
                if (currentStep < steps.length - 1) {
                    currentStep++;
                    showStep(currentStep);
                }
            });

            // Handle Previous button click
            $('.prevBtn').on('click', function() {
                if (currentStep > 0) {
                    currentStep--;
                    showStep(currentStep);
                }
            });

            // Handle form submission
            $('#multiStepForm').on('submit', function(event) {
                event.preventDefault();
                alert('Form submitted successfully!');
            });
        });
    </script>

    <!---image preview script-->
    <script>
        function readURL(input, previewContainerId) {
            $('#' + previewContainerId).html(''); // Clear previous previews
            if (input.files) {
                $.each(input.files, function(index, file) {
                    var reader = new FileReader();
                    reader.onload = function(e) {
                        var img = $('<img />', {
                            'src': e.target.result,
                            'class': 'img-thumbnail',
                            'style': 'max-width: 100px; margin-right: 5px; margin-bottom: 5px;'
                        });
                        $('#' + previewContainerId).append(img);
                    }
                    reader.readAsDataURL(file);
                });
            }
        }


        // Boat image preview (multiple)
        $(document).on("change", '#boat-image', function() {
            readURL(this, 'boat-image-previews');
        });

        // Boat banner image preview (single)
        $(document).on('change', '#boat-banner-image', function() {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#boat-banner-preview').attr('src', e.target.result).show();
            }
            reader.readAsDataURL(this.files[0]);
        });

        // Cabin image preview (multiple)
        $(document).on("change", '#cabin-image', function() {
            let index = parseInt($(this).attr('data-index')) || 0;
            readURL(this, `cabin-image-previews_${index}`);
        });
    </script>

    <!---features script--->
    <script>
        $(document).on("click", ".boatFeatureAdd", function() {
            let index = parseInt($(this).attr("data-index")) || 0;
            console.log("index", index);
            index++;
            $(".boatFeature").append(`
        <div class="form-group boatFeatureField_${index}">
            <label for="" class="form-label">Boat Feature</label>
            <input type="text" name="boat_feature[]" class="form-control">

        </div>
    `);
            $(".boatFeatureButtonGroup").append(
                `<button style="margin-top: 42px" type="button" class="btn btn-danger boatFeatureFieldRemove" data-index="${index}">-</button>`
            );
            $(this).attr("data-index", index);
        });

        // Event listener for dynamically added remove button
        $(document).on("click", ".boatFeatureFieldRemove", function() {
            let index = $(this).data("index");
            $(`.boatFeatureField_${index}`).remove();
            $(this).remove();
        })



        // for cabin
        $(document).on("click", ".cabinFeatureAdd", function() {
            let index = parseInt($(this).attr("data-index")) || 0;
            let rowIndex = $(this).attr("data-row"); // Get the cabin's row index
            index++;
            $(`.cabin_${rowIndex} .cabinFeature`).append(`
        <div class="form-group cabinFeatureField_${index}">
            <label for="" class="form-label">Cabin Feature</label>
            <input type="text" name="cabin_feature[${rowIndex}][]" class="form-control">
        </div>
    `);
            $(`.cabin_${rowIndex} .cabinFeatureButtonGroup`).append(
                `<button style="margin-top: 42px" type="button" class="btn btn-danger cabinFeatureFieldRemove" data-index="${index}" data-row="${rowIndex}">-</button>`
            );
            $(this).attr("data-index", index);
        });

        $(document).on("click", ".cabinFeatureFieldRemove", function() {
            let index = $(this).data("index");
            let rowIndex = $(this).data("row"); // Get the cabin's row index
            $(`.cabin_${rowIndex} .cabinFeatureField_${index}`).remove();
            $(this).remove();
        });




        // for check in out
        $(document).on("click", ".addCheckInOut", function() {
            let index = parseInt($(this).attr("data-index")) || 0;
            index++;
            $(".checkInOutDateList").append(`
             <div class="row checkInOutField_${index}">
                <div class="col-md-5">
                    <label for="" class="form-label">Check In Date ${index}</label>
                    <input type="date" class="form-control" name="check_in_date[]" value="" required>
                </div>
                <div class="col-md-5">
                    <label for="" class="form-label">Check Out Date ${index}</label>
                        <input type="date" class="form-control" name="check_out_date[]" value="" required>
                </div>
                <div class="col-md-2">
                    <button type="button" style="margin-top: 28px" class="btn btn-danger removeCheckInOut" data-index="${index}">-</button>
                </div>
            </div>

            `);
            $(this).attr("data-index", index);
        });

        $(document).on("click", ".removeCheckInOut", function() {
            let index = $(this).data("index");
            $(`.checkInOutField_${index}`).remove();
        })


        // for perwise price
        $(document).on("click", ".personWisePriceAdd", function() {
            let index = parseInt($(this).attr("data-index")) || 0;
            index++;
            $(".personWisePriceList").append(`
            <div class="row personWisePriceField_${index}">
                <div class="col-md-5">
                    <label for="" class="form-label">Person</label>
                    <input type="text" class="form-control" name="boat_person[]" value="" required>
                </div>
                <div class="col-md-5">
                    <label for="" class="form-label">Price</label>
                    <input type="number" step="any" class="form-control" name="boat_person_price[]" value="" required>
                </div>
                <div class="col-md-2">
                    <button type="button" style="margin-top: 28px" class="btn btn-danger personWisePriceRemove" data-index="${index}">-</button>
                </div>
            </div>
            `);
            $(this).attr("data-index", index);
        })


        $(document).on("click", ".personWisePriceRemove", function() {
            let index = $(this).data("index");
            $(`.personWisePriceField_${index}`).remove();
        })




        // for cabin add
        $(document).on("click", ".addCabin", function() {
            let index = parseInt($(this).attr("data-index")) || 0;
            index++;
            $(".cabinList").append(`
            <div class="row cabin_${index}">
            <div class="col-md-12">
            <hr>
            <div class="d-flex justify-content-between">
                <h5>Cabin ${index}</h5>
                <button type="button" class="btn btn-danger removeCabin" data-index="${index}">Remove Cabin -</button>
            </div>
            <hr>
        </div>
        <div class="col-md-4 mb-2">
            <label for="" class="form-label">Cabin Title</label>
            <input type="text" name="cabin_title[${index}]" class="form-control boatCabinTitle" data-id="${index}" placeholder="please enter your title">
        </div>
        <div class="col-md-4 mb-2">
            <label for="" class="form-label">Cabin Slug</label>
            <input type="text" name="cabin_slug[${index}]" class="form-control boatCabinSlug_${index}" readonly placeholder="slug">
        </div>
        <div class="col-md-4 mb-2">
            <label for="" class="form-label">Cabin Type</label>
            <input type="text" name="cabin_type[${index}]" class="form-control" placeholder="eg: deluxe, standard">
        </div>
        <div class="col-md-4 mb-2">
            <label for="" class="form-label">Cabin Price</label>
            <input type="text" name="cabin_price[${index}]" class="form-control" placeholder="Price">
        </div>
        <div class="col-md-4 mb-2">
            <label for="" class="form-label">Person (How many person of this Cabin)</label>
            <input type="text" name="cabin_person[${index}]" class="form-control" placeholder="How many person of this Cabin">
        </div>
        <div class="col-md-4 mb-2">
            <label for="" class="form-label">Extra Person Fee</label>
            <input type="text" class="form-control" name="cabin_extra_person_fee[${index}]" placeholder="Extra Person Fee">
        </div>
        <hr>
        <div class="col-md-4 mb-2">
            <label for="cabin-image" class="form-label">Cabin Image</label>
            <input type="file" name="cabin_image[${index}][]" id="cabin-image" data-index="${index}" class="form-control" multiple accept="image/*">
            <small class="text-danger">Image size will be 400x400 px</small>
            <div id="cabin-image-previews_${index}" class="mt-2"></div>
        </div>
        <div class="col-md-6 mb-1">
            <div class="row cabin_${index}">
                <div class="col-10 col-md-11">
                    <div class="cabinFeature">
                        <div class="form-group">
                            <label for="" class="form-label">Cabin Feature</label>
                            <input type="text" name="cabin_feature[${index}][]" class="form-control">
                        </div>
                    </div>
                </div>
                <div class="col-2 col-md-1 cabinFeatureButtonGroup">
                    <button type="button" style="margin-top: 28px" class="btn btn-primary cabinFeatureAdd" data-row="${index}" data-index="1">+</button>
                </div>
            </div>
        </div>
    </div>
    `);
            $(this).attr("data-index", index);
        });

        // Remove a cabin
        $(document).on("click", ".removeCabin", function() {
            let index = $(this).data("index");
            $(`.cabin_${index}`).remove();
        });
    </script>



    <!---validation for steps --->
    <script>
        // step 1 input validation
        // change destination
        $(document).on("change", ".destinationSelect", function() {
            let destination = $(this).val();
            if (destination === "" || destination == 'Select Destination') {
                console.log("destination value error er vitore");
                $('#destinationErrors').text('Please select your Destination.');
            } else {
                console.log("destination value error er baire", destination);
                $('#destinationErrors').text('');
            }
            checkStep1Completion();
        })


        // keyup boat title
        $(document).on("keyup", ".boatTitle", function() {
            let boatTitle = $(this).val();
            if (boatTitle.length < 3) {
                console.log("boat title error er vitore");
                $('#boatTitleErrors').text('Boat Title must be at least 3 characters long.');
            } else {
                console.log("boat title error er baire");
                $('#boatTitleErrors').text('');
            }
            checkStep1Completion();
        })


        // keyup boat price
        $(document).on("keyup", ".fullBoatPrice", function() {
            let fullboatPrice = $(this).val();
            if (fullboatPrice == '') {
                console.log("boat price error er vitore");

                $('#fullboatPriceErrors').text('please Insert Price.');
            } else {
                console.log("boat price error er baire");
                $('#fullboatPriceErrors').text('');
            }
            checkStep1Completion();
        })


        // keyup percentage of booking
        $(document).on("keyup", ".percentageOfPayment", function() {
            let percentageOfPayment = $(this).val();
            if (percentageOfPayment == '') {
                console.log("percentage of payemnt error er vitore");
                $('#bookiPercentageErrors').text('please Insert Booking Percentage Amount.');
            } else {
                console.log("percentage of payemnt error er baire");
                $('#bookiPercentageErrors').text('');
            }
            checkStep1Completion();
        })


        // change isStatus
        $(document).on("change", ".status", function() {
            var isChecked = $(this).is(':checked');
            if (!isChecked) {
                console.log("status error er vitore");
                $('#statusError').text('You must agree to the active status.');
            } else {
                console.log("status error er baire");
                $('#statusError').text('');
            }
            checkStep1Completion();
        })


        // change boat Image
        $(document).on("change", ".boatImages", function() {
            let boatIamges = $(this).val();
            if (boatIamges === "") {
                console.log("boat image error er vitore");
                $('#imageError').text('Please upload minimum an image.');
            } else {
                console.log("boat image error er baire");
                $('#imageError').text('');
            }
            checkStep1Completion();
        })


        // change banner image
        $(document).on("change", ".boatBannerImage", function() {
            let bannerImage = $(this).val();
            if (bannerImage === "") {
                console.log("boat banner image error er vitore");
                $('#bannerImageError').text('Please upload an Banner image.');
            } else {
                console.log("boat banner image error er baire");
                $('#bannerImageError').text('');
            }
            checkStep1Completion();
        })



        function checkStep1Completion() {
            var destination = $('.destinationSelect').val();
            var boatTitle = $(".boatTitle").val();
            var boatSlug = $(".boatSlug").val();
            var boatPrice = $(".fullBoatPrice").val();
            var percentageOfbooking = $(".percentageOfPayment").val();
            var isStatus = $(".status").is(':checked');
            var boatImage = $(".boatImages").val();
            var bannerImage = $(".boatBannerImage").val();

            // Check destination properly using '&&'
            if (destination !== '' && destination !== 'Select Destination' &&
                boatTitle.length >= 3 && boatSlug.length >= 3 && boatPrice !== '' &&
                percentageOfbooking !== '' && isStatus && boatImage !== "" && bannerImage !== "") {

                console.log("disable false inside");
                $('.first_step_next').prop('disabled', false);
            } else {
                console.log("disable true inside");
                $('.first_step_next').prop('disabled', true);
            }
        }



        // step 3 validation



    </script>
@endpush
