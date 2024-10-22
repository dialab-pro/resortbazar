<?php

namespace Modules\Boat\Admin;

use Modules\AdminController;
use Modules\Boat\Models\BoatBooking;
use Mpdf\Mpdf;

class BookingController extends AdminController
{
    public function index()
    {
        $boatBookings = BoatBooking::with('boatBookingCabin', 'boat')->latest()->get();
        return view("Boat::admin.boatBooking.index", ['boatBookings' => $boatBookings]);
    }


    public function view($id)
    {
        $boatBooking = BoatBooking::with('boatBookingCabin', 'boat')->find($id);
        return view("Boat::admin.boatBooking.view", ['boatBooking' => $boatBooking]);
    }

    public function printInvoice($id)
    {
        $boatBooking = BoatBooking::with('boatBookingCabin', 'boat')->find($id);
        $customerInfo = json_decode($boatBooking->user_info);
        // Load the invoice view and pass data
        $html = view('Boat::admin.boatBooking.adminbooking_invoice', compact('boatBooking', 'customerInfo'))->render();

        // Initialize mPDF and generate PDF
        $mpdf = new Mpdf();
        $mpdf->WriteHTML($html);

        // Output PDF as a download
        $mpdf->Output('invoice.pdf', 'D');  // 'I' to display inline, 'D' for download
    }
}
