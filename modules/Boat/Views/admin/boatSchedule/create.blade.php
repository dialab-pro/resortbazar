@extends('admin.layouts.app')

@section('content')
    <div class="container-fluid">
        <div class="d-flex justify-content-between mb20">
            <h1 class="title-bar">Schedule Create</h1>
            <div class="title-actions">

                <a href="{{ route('schedule.admin.index') }}" class="btn btn-primary">{{ __('View Schedule') }}</a>

            </div>
        </div>
        @include('admin.message')
        <div>
            <div class="panel">
                <div class="panel-body">
                    <form action="{{ route('schedule.admin.store') }}" class="bravo-form-item" method="POST"
                        enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <div class="col-md-4">
                                <label for="" class="form-label">Select Boat</label>
                                <select name="boat_id" id="" class="form-control">
                                    <option selected readonly>Select Boat</option>
                                    @foreach ($boats as $key => $boat)
                                        <option value="{{ $boat->id }}">{{ $boat->title }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="row">
                            <div class="bookingAvailable_1 col-md-4">
                                <label for="" class="form-label">Booking Available Date</label>
                                <input type="date" class="form-control" name="booking_available[]">
                            </div>
                            <div class="ghat_leave_1 col-md-4">
                                <label for="" class="form-label">Ghat Leave Date</label>
                                <input type="date" class="form-control" name="ghat_leaving_date[]">
                            </div>
                            <div class="col-md-1" style="margin-top: auto">
                                <label for=""></label>
                                <button type="button" class="btn btn-primary addList">+</button>
                            </div>
                        </div>
                        <input type="hidden" class="listIndex" value="1">
                        <div class="bookingDatelist">

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
        // $(document).on("keyup", ".boatCabinTitle", function() {
        //     var value = $(this).val();
        //     var slug = value.toLowerCase().replace(/ /g, '-').replace(/[^\w-]+/g, '');
        //     $('.boatCabinSlug').val(slug);
        // })
        $(document).on("click", ".addList", function() {
            console.log("add list clicked");
            let listIndex = parseInt($('.listIndex').val());
            listIndex++;

            $(".bookingDatelist").append(`
            <div class="row bookingRow">
                            <div class="bookingAvailable_${listIndex} col-md-4">
                                <label for="" class="form-label">Booking Available Date</label>
                                <input type="date" class="form-control" name="booking_available[]" required>
                            </div>
                            <div class="ghat_leave_${listIndex} col-md-4">
                                <label for="" class="form-label">Ghat Leave Date</label>
                                <input type="date" class="form-control" name="ghat_leaving_date[]" required>
                            </div>
                            <div class="col-md-1" style="margin-top: auto">
                                <label for=""></label>
                                <button type="button" class="btn btn-danger removeList">-</button>
                            </div>
                        </div>
            `);
            $(".listIndex").val(listIndex);


        })


        $(document).on("click", ".removeList", function() {

            $(this).closest('.bookingRow').remove();
        });
    </script>
@endpush
