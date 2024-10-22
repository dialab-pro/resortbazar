@extends('admin.layouts.app')
@section('content')
    <div class="container-fluid">
        <div class="d-flex justify-content-between mb20">
            <h1 class="title-bar">Boat Booking View</h1>

        </div>
        @include('admin.message')
        <div class="panel">
            <div class="panel-body">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <img src="{{ asset($boatBooking->boat->image) }}" alt="boat image" width="100%">
                        </div>
                        <div class="col-md-8">
                            <h4>Booking Info</h4>
                            <table class="table table-striped">
                                <tr>
                                    <th>Booking Id</th>
                                    <td>{{ $boatBooking->booking_id ?? 'N/A' }}</td>
                                </tr>
                                <tr>
                                    <th>Booked User</th>
                                    <td>{{ $boatBooking->user->name ?? 'N/A' }}</td>
                                </tr>
                                <tr>
                                    <th>Booking Date</th>
                                    <td>{{ \Carbon\Carbon::parse($boatBooking->booking_date)->format('Y-m-d h:i A') ?? 'N/A' }}
                                    </td>
                                </tr>
                                <tr>
                                    <th>Booked Date</th>
                                    <td>
                                        {{ \Carbon\Carbon::parse($boatBooking->booked_date)->format('Y-m-d') ?? 'N/A' }}
                                        {{ \Carbon\Carbon::parse($boatBooking->booked_time)->format('h:i A') }}
                                    </td>
                                </tr>
                                <tr>
                                    <th>Boat Name</th>
                                    <td>{{ $boatBooking->boat->title ?? 'N/A' }}</td>
                                </tr>
                                <tr>
                                    <th>Boat Location</th>
                                    <td>{{ $boatBooking->boat->destination->title ?? 'N/A' }}</td>
                                </tr>
                                <tr>
                                    <th>Booking Status</th>
                                    <td>{{ $boatBooking->booking_status ?? 'N/A' }}</td>
                                </tr>

                                <tr>
                                    <th>Payment Method</th>
                                    <td>-</td>
                                </tr>

                                <tr>
                                    <th>Payment Status</th>
                                    <td>{{ $boatBooking->payment_status ?? 'N/A' }}</td>
                                </tr>
                                <tr>
                                    <th>Booked Cabins</th>
                                    <td>
                                        @foreach ($boatBooking->boatBookingCabin as $key => $cabin)
                                            <p><strong>Name:</strong> {{ $cabin->boatCabin->title ?? 'N/A' }}
                                                <strong>Price:</strong> {{ $cabin->cabin_price ?? 'N/A' }}
                                            </p>
                                        @endforeach
                                    </td>
                                </tr>
                                <tr>
                                    <th>Subtotal</th>
                                    <td>{{ $boatBooking->subtotal ?? 'N/A' }}</td>
                                </tr>
                                <tr>
                                    <th>Total</th>
                                    <td>{{ $boatBooking->total_amount ?? 'N/A' }}</td>
                                </tr>
                            </table>
                            <div class="float-end">
                                <a target="_blank" href="{{ route('booking.admin.printInvoice', $boatBooking->id) }}"
                                    class="btn btn-primary">Print</a>
                                <a href="{{ route('booking.admin.index') }}" class="btn btn-secondary">Back</a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    @endsection
