@extends('layouts.user')
@section('content')
    <h2 class="title-bar no-border-bottom">
        {{ __('Boat Booking History') }}
    </h2>
    @include('admin.message')
    <div class="booking-history-manager">
        <div class="tabbable">
            <ul class="nav nav-tabs ht-nav-tabs">
                <?php $status_type = Request::query('status'); ?>
                <li class="@if (empty($status_type)) active @endif">
                    <a href="{{ route('user.boat_booking_history') }}">{{ __('All Boat Booking') }}</a>
                </li>
                @if (!empty($statues))
                    @foreach ($statues as $status)
                        <li class="@if (!empty($status_type) && $status_type == $status) active @endif">
                            <a
                                href="{{ route('user.booking_history', ['status' => $status]) }}">{{ booking_status_to_text($status) }}</a>
                        </li>
                    @endforeach
                @endif
            </ul>
            @if (!empty($boatBooking) and $boatBooking->count() > 0)
                <div class="tab-content">
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped table-booking-history">
                            <thead>
                                <tr>
                                    <th width="2%">{{ __('Sl.') }}</th>
                                    <th>{{ __('Boat Name') }}</th>
                                    <th class="a-hidden">{{ __('Booking Date') }}</th>
                                    <th class="a-hidden">{{ __('Booked Date') }}</th>
                                    <th>{{ __('Total') }}</th>
                                    <th>{{ __('Booking Status') }}</th>
                                    <th>{{ __('Payment Status') }}</th>
                                    <th class="a-hidden">{{ __('payment Method') }}</th>
                                    <th>{{ __('Action') }}</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($boatBooking as $key => $booking)
                                    <tr>
                                        <td>{{ $key + 1 }}</td>
                                        <td>{{ $booking->boat->title ?? 'N/A' }}</td>
                                        <td>{{ \Carbon\Carbon::parse($booking->booking_date)->format('Y-m-d h:i A') ?? "N/A" }}</td>
                                        <td>{{ \Carbon\Carbon::parse($booking->booked_date)->format('Y-m-d') ?? "N/A" }}  {{ \Carbon\Carbon::parse($booking->booked_time)->format('h:i A') ?? "N/A" }}</td>
                                        <td>{{ $booking->subtotal ?? 'N/A' }}</td>
                                        <td>{{ $booking->booking_status ?? 'N/A' }}</td>
                                        <td>{{ $booking->payment_status ?? 'N/A' }} @if ($booking->payment_status == 'unpaid')
                                            <button type="button" class="btn btn-secondary">make payment?</button>
                                        @endif</td>
                                        <td> - </td>
                                        <td>
                                           <div class="d-flex justify-content-between">
                                            <a href="#" class="btn btn-primary">view</a>
                                            <a href="#" class="btn btn-danger">Delete</a>
                                           </div>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    <div class="bravo-pagination">
                        {{-- {{$boatBooking->links()}} --}}
                    </div>
                </div>
            @else
                {{ __('No Booking History') }}
            @endif
        </div>
        <div class="modal" tabindex="-1" id="modal_booking_detail">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">{{ __('Booking ID: #') }} <span class="user_id"></span></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="d-flex justify-content-center">{{ __('Loading...') }}</div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">{{ __('Close') }}</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('js')
    <script>
        $('.btn-info-booking').on('click', function(e) {
            var btn = $(this);
            $(this).find('.user_id').html(btn.data('id'));
            $(this).find('.modal-body').html(
                '<div class="d-flex justify-content-center">{{ __('Loading...') }}</div>');
            var modal = $("#modal_booking_detail");
            $.get(btn.data('ajax'), function(html) {
                modal.find('.modal-body').html(html);
            })
        })
    </script>
@endpush
