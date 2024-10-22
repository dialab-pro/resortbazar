@extends('admin.layouts.app')

@section('content')
    <div class="container-fluid">
        <div class="d-flex justify-content-between mb20">
            <h1 class="title-bar">Boat Cabin Create</h1>
            <div class="title-actions">

                <a href="{{ route('boatCabin.admin.index') }}" class="btn btn-primary">{{ __('View Boats Cabin') }}</a>

            </div>
        </div>
        @include('admin.message')
        <div>
            <div class="panel">
                <div class="panel-body">
                    <form action="{{ route('boatCabin.admin.store') }}" class="bravo-form-item" method="POST"
                        enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <div class="col-md-4">
                                <label for="" class="form-label">Select Boat</label>
                                {{-- @dd($destinations); --}}
                                <select name="boat_id" class="form-select" id="">
                                    <option selected disable class="select-option">Select Boat</option>
                                    @foreach ($boats as $boat)
                                        <option value="{{ $boat->id }}">{{ $boat->title }}</option>
                                    @endforeach
                                </select>

                            </div>

                            <div class="col-md-4">
                                <label for="" class="form-label">Cabin Title</label>
                                <input type="text" name="title" class="form-control boatCabinTitle"
                                    placeholder="please enter your title">
                            </div>
                            <div class="col-md-4">
                                <label for="" class="form-label">Cabin Slug</label>
                                <input type="text" name="slug" class="form-control boatCabinSlug" readonly
                                    placeholder="slug">
                            </div>
                            <div class="col-md-4">
                                <label for="" class="form-label">Cabin Type </label>
                                <input type="text" name="type" class="form-control" placeholder="eg: deluxe,standard">
                            </div>
                            <div class="col-md-4">
                                <label for="" class="form-label">Cabin Price </label>
                                <input type="text" name="price" class="form-control" placeholder="Price">
                            </div>
                            <div class="col-md-4">
                                <label for="" class="form-label">Person (How many person of this Cabin)</label>
                                <input type="text" name="person" class="form-control"
                                    placeholder="How many person of this Cabin">
                            </div>
                            <div class="col-md-4">
                                <label for="" class="form-label">Extra Person Fee</label>
                                <input type="text" class="form-control" name="extra_person_fee"
                                    placeholder="Extra Person Fee">
                            </div>

                            <div class="col-md-4 mt-4">
                                <label for="" class="form-label">Images</label>
                                <button type="button" class="btn btn-primary addImage">+</button>

                                <div class="images">
                                    <div class="image-wrapper">
                                        <input type="file" class="form-control mt-1 image1" name="image[]">
                                        <button type="button" class="btn btn-danger removeImage mt-1">Remove</button>
                                    </div>
                                </div>

                                <input type="hidden" class="imageIndex" value="1">
                            </div>


                            <div class="col-md-4 mt-4">
                                <label for="" class="form-label">Cabin Feature</label>
                                <button type="button" class="btn btn-primary addFeature">+</button>

                                <div class="cabin-features">
                                    <div class="feature-wrapper">
                                        <input type="text" name="cabin_feature[]" class="form-control mt-1"
                                            placeholder="Feature 1">
                                        <button type="button" class="btn btn-danger removeFeature mt-1">Remove</button>
                                    </div>
                                </div>

                                <input type="hidden" class="featureIndex" value="1">
                            </div>

                        </div>

                        <div class="col-md-4 mt-4">
                            <button type="submit" class="btn btn-primary">Submit</button>
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

        // add image
        $(document).on("click", ".addImage", function() {
            let imageIndex = parseInt($(".imageIndex").val());
            imageIndex++;
            $(".images").append(`
        <div class="image-wrapper">
            <input type="file" class="form-control mt-1 image${imageIndex}" name="image[]">
            <button type="button" class="btn btn-danger removeImage mt-1">Remove</button>
        </div>
    `);
            $(".imageIndex").val(imageIndex);
        });

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
        $(document).on("click", ".removeFeature", function() {
            $(this).closest('.feature-wrapper').remove();
        });
    </script>
@endpush
