@extends('admin.layouts.app')

@section('content')
    <div class="container-fluid">
        <div class="d-flex justify-content-between mb20">
            <h1 class="title-bar">Boat Cabin Edit</h1>
            <div class="title-actions">

                <a href="{{ route('boatCabin.admin.index') }}" class="btn btn-primary">{{ __('View Boats Cabin') }}</a>

            </div>
        </div>
        @include('admin.message')
        <div>
            <div class="panel">
                <div class="panel-body">
                    <form action="{{ route('boatCabin.admin.update', $boatCabin->id) }}" class="bravo-form-item"
                        method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <div class="col-md-4">
                                <label for="" class="form-label">Select Boat</label>
                                {{-- @dd($destinations); --}}
                                <select name="boat_id" class="form-select" id="">
                                    <option selected disable class="select-option">Select Boat</option>
                                    @foreach ($boats as $boat)
                                        <option value="{{ $boat->id }}"
                                            @if ($boatCabin->boat_id == $boat->id) selected @endif>
                                            {{ $boat->title }}</option>
                                    @endforeach
                                </select>

                            </div>

                            <div class="col-md-4">
                                <label for="" class="form-label">Cabin Title</label>
                                <input type="text" name="title" class="form-control boatCabinTitle"
                                    placeholder="please enter your title" value="{{ $boatCabin->title }}">
                            </div>
                            <div class="col-md-4">
                                <label for="" class="form-label">Cabin Slug</label>
                                <input type="text" name="slug" class="form-control boatCabinSlug" readonly
                                    placeholder="slug" value="{{ $boatCabin->slug }}">
                            </div>
                            <div class="col-md-4">
                                <label for="" class="form-label">Cabin Type </label>
                                <input type="text" name="type" class="form-control" placeholder="eg: deluxe,standard"
                                    value="{{ $boatCabin->type }}">
                            </div>
                            <div class="col-md-4">
                                <label for="" class="form-label">Cabin Price </label>
                                <input type="text" name="price" class="form-control" placeholder="Price"
                                    value="{{ $boatCabin->price }}">
                            </div>
                            <div class="col-md-4">
                                <label for="" class="form-label">Person (How many person of this Cabin)</label>
                                <input type="text" name="person" class="form-control"
                                    placeholder="How many person of this Cabin"
                                    value="{{ old('person', $boatCabin->person) }}">
                            </div>
                            <div class="col-md-4">
                                <label for="" class="form-label">Extra Person Fee</label>
                                <input type="text" class="form-control" name="extra_person_fee"
                                    placeholder="Extra Person Fee"
                                    value="{{ old('extra_person_fee', $boatCabin->extra_person_fee) }}">
                            </div>
                            @php
                                $boatImage = $boatCabin->image;
                                $boatFeature = $boatCabin->cabin_feature;
                                $existingImages = [];
                                $existingFeatures = [];
                                if ($boatImage) {
                                    $existingImages = json_decode($boatImage);
                                }
                                // dd($existingImages);
                                if ($boatFeature) {
                                    $existingFeatures = json_decode($boatFeature);
                                }
                            @endphp

                            <div class="col-md-4 mt-4">
                                <label for="" class="form-label">Images</label>
                                <button type="button" class="btn btn-primary addImage">+</button>

                                <div class="images">
                                    <!-- Loop through existing images -->
                                    @foreach ($existingImages as $index => $image)
                                        <img src="{{ asset($image) }}" alt="" width="100px" height="100px">
                                        <div class="image-wrapper">
                                            <input type="file" class="form-control mt-1 image{{ $index + 1 }}"
                                                name="image[]" value="{{ $image }}">
                                            <button type="button" class="btn btn-danger removeImage mt-1">Remove</button>
                                        </div>
                                    @endforeach
                                </div>

                                <input type="hidden" class="imageIndex" value="{{ count($existingImages) }}">
                            </div>


                            <div class="col-md-4 mt-4">
                                <label for="" class="form-label">Cabin Feature</label>
                                <button type="button" class="btn btn-primary addFeature">+</button>

                                @if ($existingFeatures)
                                    <div class="cabin-features">
                                        <!-- Loop through existing features -->
                                        @foreach ($existingFeatures as $index => $feature)
                                            <div class="feature-wrapper">
                                                <input type="text" name="cabin_feature[]" class="form-control mt-1"
                                                    value="{{ $feature }}"
                                                    placeholder="Feature {{ $index + 1 }}">
                                                <button type="button"
                                                    class="btn btn-danger removeFeature mt-1">Remove</button>
                                            </div>
                                        @endforeach
                                    </div>

                                    <input type="hidden" class="featureIndex" value="{{ count($existingFeatures) }}">
                                @endif
                            </div>



                            <div class="col-md-4 mt-4">
                                <button type="submit" class="btn btn-primary">Update</button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
@endsection

@push('js')
    <script>
        $(document).on("keyup", ".boatCabinTitle", function() {
            var value = $(this).val();
            var slug = value.toLowerCase().replace(/ /g, '-').replace(/[^\w-]+/g, '');
            $('.boatCabinSlug').val(slug);
        })


        // Add new image input field
        $(document).on("click", ".addImage", function() {
            let imageIndex = parseInt($(".imageIndex").val());
            imageIndex++;
            $(".images").append(`
        <div class="image-wrapper">
            <input type="file" class="form-control mt-1 image${imageIndex}" name="image[]" placeholder="Image ${imageIndex}">
            <button type="button" class="btn btn-danger removeImage mt-1">Remove</button>
        </div>
    `);
            $(".imageIndex").val(imageIndex);
        });

        // Remove image input field
        $(document).on("click", ".removeImage", function() {
            $(this).closest('.image-wrapper').remove();
        });

        // Add new cabin feature input field
        $(document).on("click", ".addFeature", function() {
            let featureIndex = parseInt($(".featureIndex").val());
            featureIndex++;
            $(".cabin-features").append(`
        <div class="feature-wrapper">
            <input type="text" name="cabin_feature[]" class="form-control mt-1" placeholder="Feature ${featureIndex}">
            <button type="button" class="btn btn-danger removeFeature mt-1">Remove</button>
        </div>
    `);
            $(".featureIndex").val(featureIndex);
        });

        // Remove cabin feature input field
        $(document).on("click", ".removeFeature", function() {
            $(this).closest('.feature-wrapper').remove();
        });
    </script>
@endpush
