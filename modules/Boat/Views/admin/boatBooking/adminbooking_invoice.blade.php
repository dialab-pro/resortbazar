<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Invoice</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        .invoice-container {
            max-width: 800px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .invoice-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
            border-bottom: 2px solid #f1f1f1;
            padding-bottom: 15px;
        }

        .invoice-header h1 {
            margin: 0;
            font-size: 28px;
            color: #333;
        }

        .invoice-header .company-details {
            text-align: right;
        }

        .invoice-header .company-details p {
            margin: 5px 0;
            color: #666;
        }

        .invoice-body {
            margin-bottom: 20px;
        }

        .invoice-body .details {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .invoice-body .details div {
            width: 48%;
        }

        .invoice-body .details div p {
            margin: 5px 0;
        }

        .invoice-table {
            width: 100%;
            border-collapse: collapse;
        }

        .invoice-table th,
        .invoice-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .invoice-table th {
            background-color: #f1f1f1;
        }

        .total {
            text-align: right;
            margin-top: 20px;
        }

        .total h2 {
            margin: 0;
            font-size: 22px;
            color: #333;
        }

        .invoice-footer {
            margin-top: 40px;
            text-align: center;
            color: #888;
            font-size: 14px;
        }
    </style>
</head>

<body>

    <div class="invoice-container">
        <div class="invoice-header">
            <div class="invoice-title">
                <h1>Booking Invoice</h1>
            </div>
            <div class="company-details">

                <p>Resort Bazar</p>
                <p>Tarakandi, Manohardi, Narsingdi, Dhaka</p>
                {{-- <p>Email: info@company.com</p> --}}
            </div>
        </div>

        <div class="invoice-body">
            <div class="details">
                <div style="float: left; width: 48%;">
                    <p><strong>Booking Number:</strong> {{ $boatBooking->booking_id ?? '' }}</p>
                    <p><strong>Booking Date:</strong> {{ $boatBooking->booking_date ?? '' }}</p>
                    <p><strong>Client Name:</strong>{{ $customerInfo->customer_name ?? '' }}</p>
                    <p><strong>Email:</strong> {{ $customerInfo->customer_email ?? '' }}</p>
                </div>
                <div style="float: right; width: 48%;">
                    <p><strong>Service Date:</strong> {{ $boatBooking->booked_date ?? '' }}</p>
                    <p><strong>Service type:</strong>{{ $boatBooking->booking_type ?? '' }}</p>
                    <p><strong>Payment Type:</strong>{{ $boatBooking->payment_method ?? '' }}</p>
                </div>
                <div style="clear: both;"></div>
            </div>


            <table class="invoice-table">
                <thead>
                    <tr>
                        <th>Description</th>
                        <th>type</th>
                        <th>Cabin Price</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($boatBooking->boatBookingCabin as $cabin)
                        <tr>
                            <td>{{ $cabin->boatCabin->title ?? '' }}</td>
                            <td>{{ $cabin->boatCabin->type ?? '' }}</td>
                            <td>{{ $cabin->cabin_price ?? '' }}</td>
                            <td>{{ $cabin->total_amount ?? '' }}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>

            <div class="total">
                <h2>Total: {{ $boatBooking->total_amount ?? '' }}</h2>
            </div>
        </div>

        <div class="invoice-footer">
            <p>Thank you for your booking!</p>
            <p>If you have any questions, feel free to contact us at info@company.com.</p>
        </div>
    </div>

</body>

</html>
