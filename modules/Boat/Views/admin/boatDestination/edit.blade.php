@extends('admin.layouts.app')

@section('content')
    <div class="container-fluid">
        <div class="d-flex justify-content-between mb20">
            <h1 class="title-bar">{{ !empty($boatDestinations) ? __('Destination') : __('Create Destinations') }}</h1>
            <div class="title-actions">
                @if (empty($recovery))
                    <a href="{{ route('boat.admin.destination') }}" class="btn btn-primary">{{ __('View Destination') }}</a>
                @endif
            </div>
        </div>
        @include('admin.message')
        <div>
            <div class="panel">
                <div class="panel-body">
                    <form action="{{ route('boat.admin.destinationUpdate', $boatdestination->id) }}" class="bravo-form-item"
                        method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <div class="col-md-4">
                                <label for="" class="form-label">Destination Title</label>
                                <input type="text" name="title" class="form-control destinationTitle"
                                    placeholder="please enter your title" value="{{ $boatdestination->title ?? 'N/A' }}">
                            </div>
                            <div class="col-md-4">
                                <label for="" class="form-label">Destination Slug</label>
                                <input type="text" name="slug" class="form-control destinationSlug" readonly
                                    placeholder="slug" value="{{ $boatdestination->slug }}">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="imageUpload">Image</label>
                                    <input type="file" class="form-control-file" id="imageUpload" name="image"
                                        onchange="previewImage(event)">
                                </div>

                                <div class="form-group">
                                    <img id="imagePreview" src="{{ asset($boatdestination->image) }}" alt="Image Preview"
                                        class="img-thumbnail" style="max-width: 300px;">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="imageUpload">Banner Image</label>
                                    <input type="file" class="form-control-file" id="imageUpload" name="banner_image"
                                        onchange="bannerImage(event)">
                                </div>

                                <div class="form-group">
                                    <img id="bannerImagePreview" src="{{ asset($boatdestination->banner_image) }}"
                                        alt="Image Preview" class="img-thumbnail" style="max-width: 300px;">
                                </div>


                            </div>
                        </div>
                        <hr>

                        <div class="row">
                            <div class="col-md-4">
                                <label for="" class="form-label">Short Description</label>
                                <textarea class="form-control" name="short_description" id="" cols="30" rows="10">{{ $boatdestination->short_description }}</textarea>
                            </div>
                            <div class="col-md-4">
                                <label for="" class="form-label">Long Description</label>
                                <textarea name="long_description" class="d-none has-ckeditor" cols="30" rows="10">{{ $boatdestination->long_description }}</textarea>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group m-auto">
                                    <input type="checkbox" name="status" data-toggle="toggle"
                                        @if (isset($boatdestination->status) && $boatdestination->status == 1) checked @endif value="1">
                                    <label for="" class="form-label">status</label>
                                </div>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary">update</button>

                    </form>

                </div>
            </div>
        </div>
    </div>
@endsection

@push('js')
    <script>
        $(document).on("keyup", ".destinationTitle", function() {
            var value = $(this).val();
            var slug = value.toLowerCase().replace(/ /g, '-').replace(/[^\w-]+/g, '');
            $('.destinationSlug').val(slug);
        })


          // upload image with preview
          function previewImage(event) {
            const imagePreview = document.getElementById('imagePreview');
            const file = event.target.files[0];

            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    imagePreview.src = e.target.result;
                    imagePreview.style.display = 'block';
                }
                reader.readAsDataURL(file);
            }
        }

        // upload banner image
        function bannerImage(event) {
            const bannerImagePreview = document.getElementById('bannerImagePreview');
            const file = event.target.files[0];

            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    bannerImagePreview.src = e.target.result;
                    bannerImagePreview.style.display = 'block';
                }
                reader.readAsDataURL(file);
            }
        }
    </script>
@endpush
