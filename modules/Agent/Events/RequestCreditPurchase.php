<?php
/**
 * Created by PhpStorm.
 * User: h2 gaming
 * Date: 8/23/2019
 * Time: 10:33 PM
 */
namespace Modules\Agent\Events;

use Illuminate\Queue\SerializesModels;

class  RequestCreditPurchase
{
    use SerializesModels;
    public $user;
    public $payment;

    public function __construct($user,$payment)
    {
        $this->user = $user;
        $this->payment = $payment;
    }
}
