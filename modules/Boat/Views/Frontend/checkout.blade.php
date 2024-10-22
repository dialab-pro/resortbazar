@extends('layouts.app')
@section('content')
    <div class="container mt-2">
        <div class="row">
            <div class="col-md-12">


                <div class="row shadow-sm p-4 mb-5 mt-5 bg-white rounded section-card">
                    <div class="col-md-12">
                        <h3 class="section-title">Checkout</h3>
                        <hr>
                    </div>
                    <div class="col-md-6">

                        <img class="img-fluid rounded" src="{{ asset($boatbooking->boat->image) }}" alt="Boat Image">
                    </div>
                    <div class="col-md-6">
                        <h4 class="section-subtitle"><i class="fas fa-ship"></i> Boat Details</h4>
                        <table class="table table-striped mt-3">
                            <tr>
                                <th>Booking ID</th>
                                <td>{{ $boatbooking->booking_id ?? 'N/A' }}</td>
                            </tr>
                            <tr>
                                <th>Boat Name</th>
                                <td>{{ $boatbooking->boat->title ?? 'N/A' }}</td>
                            </tr>
                            <tr>
                                <th>Booking Date And Time</th>
                                <td> {{ \Carbon\Carbon::parse($boatbooking->booking_date)->format('Y-m-d h:i A') }}</td>

                            </tr>
                            <tr>
                                <th>Booked Date and Time</th>
                                <td>{{ $boatbooking->booked_date }} -
                                    {{ \Carbon\Carbon::parse($boatbooking->booked_time)->format('h:i A') }}</td>
                            </tr>
                            <tr>
                                <th>Booked Type</th>
                                <td>
                                    {{ $boatbooking->booking_type ?? '' }}
                                </td>
                            </tr>
                            @if ($boatbooking->booking_type == 'boat')
                                <tr>
                                    <th>Total Persons</th>
                                    <td>{{ $boatbooking->persons ?? '' }}</td>
                                </tr>
                                <tr>
                                    <th>Person Rate</th>
                                    <td>{{ $boatbooking->person_rate ?? '' }}</td>
                                </tr>
                                <tr>
                                    <th>Total Amount</th>
                                    <td>{{ $boatbooking->total_amount ?? 'N/A' }}</td>
                                </tr>
                            @endif


                        </table>

                        @if ($boatbooking->booking_type !== 'boat')
                            <h4 class="section-subtitle"><i class="fas fa-bed"></i> Cabin Details</h4>
                            <table class="table table-striped mt-3">
                                <thead>
                                    <th>Cabin Name</th>
                                    <th>Price</th>
                                </thead>
                                <tbody>
                                    @foreach ($boatbooking->boatBookingCabin as $key => $cabin)
                                        <tr>
                                            <th>{{ $cabin->boatCabin->title ?? 'N/A' }}</th>
                                            <td>
                                                @if ($boatbooking->booking_type == 'boat')
                                                    -
                                                @else
                                                    {{ $cabin->cabin_price ?? 'N/A' }}
                                                @endif
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>Subtotal</th>
                                        <td>{{ $boatbooking->subtotal ?? 'N/A' }}</td>
                                    </tr>
                                    <tr>
                                        <th>Discount</th>
                                        <td>{{ $boatbooking->discount_amount ?? '-' }}</td>
                                    </tr>
                                    <tr>
                                        <th>Total</th>
                                        <td>{{ $boatbooking->total_amount ?? 'N/A' }}</td>
                                    </tr>
                                </tfoot>
                            </table>
                        @endif



                        <hr>
                        <form action="{{ route('boat.front.boatCabinBookingConfirmCheckout', $boatbooking->id) }}"
                            method="POST">
                            @csrf
                            <h4 class="section-subtitle"><i class="fas fa-ship mt-3"></i> User Details</h4>
                            <div class="row">
                                @php
                                    $auth = auth()->check();
                                    $user = auth()->user();
                                @endphp
                                <div class="col-md-12 mb-2">
                                    <label for="" class="form-label">Full Name</label>
                                    <input type="text" class="form-control" name="cus_name"
                                        placeholder="Enter Your Number" value="{{ $auth ? $user->name : '' }}">
                                </div>
                                <div class="col-md-12 mb-2">
                                    <label for="" class="form-label">Mobile Number</label>
                                    <input type="number" class="form-control" name="cus_phone"
                                        placeholder="Enter Your Number" value="{{ $auth ? $user->phone : '' }}">
                                </div>
                                <div class="col-md-12 mb-2">
                                    <label for="" class="form-label">Email Address</label>
                                    <input type="email" class="form-control" name="cus_email"
                                        placeholder="Enter Type Your Email" value="{{ $auth ? $user->email : '' }}">
                                </div>
                                <div class="col-md-12 mb-2">
                                    <label for="" class="form-label">Address</label>
                                    <input type="text" class="form-control" name="cus_address"
                                        placeholder="Enter Your Address" value="{{ $auth ? $user->address : '' }}">
                                </div>
                            </div>
                            <h4 class="section-subtitle"><i class="fas fa-credit-card"></i>Payment Options</h4>
                            <div class="form-group mt-3">
                                <label for="payment_method" class="form-label">Select Payment Option</label>
                                <select name="payment_method" id="payment_method" class="form-control">
                                    <option selected disabled>---Select---</option>
                                    <option value="physical">Physical</option>
                                    <option value="sslcommerz">SSL Commerz</option>
                                    <option value="ekpay">ekpay</option>
                                </select>
                            </div>

                            <button type="submit" class="btn btn-primary mt-3">Checkout</button>


                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('js')
@endpush
