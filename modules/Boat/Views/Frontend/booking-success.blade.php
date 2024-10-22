@extends('layouts.app')
@section('content')
    <style>
        .success-page {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f8f9fa;
            text-align: center;
        }

        .success-icon {
            font-size: 4rem;
            color: #28a745;
            margin-bottom: 20px;
        }

        .success-message {
            font-size: 1.5rem;
            margin-bottom: 10px;
        }

        .booking-details {
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
            margin-bottom: 20px;
        }

        .details-item {
            margin-bottom: 10px;
        }

        .btn-primary {
            padding: 10px 20px;
            font-size: 1rem;
        }
    </style>

    <div class="container success-page">
        <div class="success-icon">
            <i class="bi bi-check-circle-fill"></i>
        </div>
        <div class="success-message">
            Booking Successful!
        </div>
        <div class="booking-details">
            <div class="details-item">
                <strong>Booking ID:</strong> {{ $boatBooking->booking_id ?? 'N/A' }}
            </div>
            <div class="details-item">
                <strong>Booking Date:</strong> {{ $boatBooking->booking_date ?? 'N/A' }}
            </div>
            <div class="details-item">
                <strong>Booked Date:</strong> {{ $boatBooking->booked_date ?? 'N/A' }}
            </div>
            <div class="details-item">
                <strong>Location:</strong> {{ $boatBooking->boat->destination->title ?? 'N/A' }}
            </div>
            <div class="details-item">
                <strong>Boat:</strong> {{ $boatBooking->boat->title ?? 'N/A' }}
            </div>
        </div>
        <a href="{{ route('boat.front.boatBookingPrint', $boatBooking->id) }}" class="btn btn-primary mb-3">Print</a>
        <a href="/" class="btn btn-primary">Back to Home</a>
    </div>
@endsection
