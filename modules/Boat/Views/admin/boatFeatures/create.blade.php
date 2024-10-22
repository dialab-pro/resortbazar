@extends('admin.layouts.app')

@section('content')
    <div class="container-fluid">
        <div class="d-flex justify-content-between mb20">
            <h1 class="title-bar">Feature Create</h1>
            <div class="title-actions">

                <a href="{{ route('feature.admin.index') }}" class="btn btn-primary">{{ __('View Features') }}</a>

            </div>
        </div>
        @include('admin.message')
        <div>
            <div class="panel">
                <div class="panel-body">
                    <form action="{{ route('feature.admin.store') }}" class="bravo-form-item" method="POST"
                        enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <div class="col-md-4">
                                <label for="" class="form-label">Select Boat</label>
                                <select name="boat_id" id="" class="form-select">
                                    <option selected readonly>Select Boat</option>
                                    @foreach ($boats as $key => $boat)
                                        <option value="{{ $boat->id }}">{{ $boat->title }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label for="" class="form-label">Feature Title</label>
                                <input type="text" name="title" class="form-control "
                                    placeholder="please enter your title">
                            </div>

                            <div class="col-md-4">
                                <label for="" class="form-label">Features Description </label>
                                <input type="text" name="description" class="form-control" placeholder="description">
                            </div>
                            <div class="col-md-4">
                                <input type="checkbox" name="status" class="form-control" value="1">
                                <label for="" class="form-label">Status</label>
                            </div>

                            <div class="col-md-4 mt-4">
                                <button type="submit" class="btn btn-primary">Submit</button>
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
    </script>
@endpush
