<?php

namespace Modules\Booking\Gateways;

use App\Models\User;
use GuzzleHttp\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Mockery\Exception;
use Modules\Booking\Events\BookingCreatedEvent;
use Modules\Booking\Models\Booking;
use Modules\Booking\Models\Payment;

class EkpayGateway extends BaseGateway
{
    public $name = 'Ekpay Checkout';
    protected $gateway;
    public function getOptionsConfigs()
    {
        return [
            [
                'type'  => 'checkbox',
                'id'    => 'enable',
                'label' => __('Enable ekpay Payment?')
            ],
            [
                'type'  => 'input',
                'id'    => 'ekpay_name',
                'label' => __('Custom Name'),
                'std'   => __("ekpay Payment"),
                'multi_lang' => "1"
            ],
            [
                'type'  => 'upload',
                'id'    => 'ekpay_logo_id',
                'label' => __('Custom Logo'),
            ],
            [
                'type'  => 'textarea',
                'id'    => 'ekpay_payment_note',
                'label' => __('Payment Note'),
                'multi_lang' => "1"
            ],
            [
                'type'  => 'editor',
                'id'    => 'ekpay_html',
                'label' => __('Custom HTML Description'),
                'multi_lang' => "1"
            ],
            [
                'type'       => 'checkbox',
                'id'        => 'ekpay_enable_sandbox',
                'label'     => __('Enable Sandbox Mode'),
            ],
            [
                'type'       => 'input',
                'id'        => 'ekpay_mer_reg_id',
                'label'     => __('Ekpay Mercent Registration Id'),
            ],
            [
                'type'       => 'input',
                'id'        => 'ekpay_mer_pas_key',
                'label'     => __('Ekpay Mercent Pas key'),
            ],
        ];
    }

    public function process(Request $request, $booking, $service)
    {
        // dd(json_encode($request->all()), json_encode($service), json_encode($booking));
        $customer = User::find($request->customer_id);
        if (in_array($booking->status, [
            $booking::PAID,
            $booking::COMPLETED,
            $booking::CANCELLED
        ])) {

            throw new Exception(__("Booking status does need to be paid"));
        }
        if (!$booking->pay_now) {
            throw new Exception(__("Booking total is zero. Can not process payment gateway!"));
        }
        $payment = new Payment();
        $payment->booking_id = $booking->id;
        $payment->payment_gateway = $this->id;
        $payment->status = 'draft';
        $payment->amount = (float) $booking->pay_now;
        $payment->save();
        $booking->status = $booking::UNPAID;
        $booking->payment_id = $payment->id;
        $booking->save();
        try {
            event(new BookingCreatedEvent($booking));
        } catch (\Exception $e) {
            Log::warning($e->getMessage());
        }
        $bookingSuccessUrl = $request->booking_from == 'agent' ? request()->root() .'/agent/booking/detail/' . $booking->code: $this->getReturnUrl();
        $client = new Client();
        $post_data = [
            'mer_info' => [
                'mer_reg_id' => $this->getOption('ekpay_mer_reg_id'),
                'mer_pas_key' => $this->getOption('ekpay_mer_pas_key'),
            ],
            'req_timestamp' => now()->format('Y-m-d H:i:s') . ' GMT+6',
            'feed_uri' => [
                'c_uri' => $this->getCancelUrl() . '?c=' . $booking->code,
                'f_uri' => $this->getReturnUrl() . '?c=' . $booking->code,
                's_uri' =>  $bookingSuccessUrl ,
            ],
            'cust_info' => [
                'cust_email' => $request['email'] ?? $customer->email,
                'cust_id' => 'sample_id',
                'cust_mail_addr' => $request['address_line_1'] ?? $customer->address ?? "Dhaka",
                'cust_mobo_no' => $request['phone'] ?? $customer->phone,
                'cust_name' =>  $customer->name ?? $request['first_name'] . '' . $request['last_name'],
            ],
            'trns_info' => [
                'ord_det' => 'order-details',
                'ord_id' => $booking->code,
                'trnx_amt' =>  (float)$booking->pay_now,
                'trnx_currency' => 'BDT',
                'trnx_id' => $booking->code,
            ],
            'ipn_info' => [
                'ipn_channel' => '1',
                'ipn_email' => 'customer@example.com',
                'ipn_uri' => "http://example.com/test/ipn",
            ],
            'mac_addr' => "1.1.1.1",
        ];

        $response = $client->post('https://sandbox.ekpay.gov.bd/ekpaypg/v1/merchant-api', [
            'headers' => [
                'Content-Type' => 'application/json',
                'Accept' => 'application/json',
            ],
            'body' => json_encode($post_data),
        ]);
        $response_data = json_decode($response->getBody(), true);
        $redirect_url = "https://sandbox.ekpay.gov.bd/ekpaypg/v1?sToken=" . $response_data['secure_token'] . "&trnsID=" . $booking->code;
        // dd($redirect_url,$response_data);
        response()->json([
            'url' => $redirect_url,
        ])->send();
    }

    public function confirmPayment(Request $request)
    {
        $c = $request->query('transId');
        $booking = Booking::where('code', $c)->with('payment')->first();
        $payment = $booking->payment;
        if ($payment) {
            $payment->status = 'completed';
            $payment->save();
        }
        try {
            $booking->paid += (float) $booking->pay_now;
            $booking->markAsPaid(Booking::CONFIRMED);

        } catch (\Swift_TransportException $e) {
            Log::warning($e->getMessage());
        }
        return redirect($booking->getDetailUrl())->with("success", __("You payment has been processed successfully"));
        // dd("hea eitai ek payer confirm payment ",$request->all(), $booking, $this->getReturnUrl());
    }
}
