<?php

namespace Modules\Agent;


use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Log;

use Modules\Agent\Listeners\ClearUserTokens;

// use Modules\User\Events\RequestCreditPurchase;
// use Modules\User\Events\UpdateCreditPurchase;

class EventServiceProvider extends ServiceProvider {

    /**
     * The event listener mappings for the application.
     *
     * @var array
    */

    protected $listen = [
        PasswordReset::class=>[
            ClearUserTokens::class
        ]
        // RequestCreditPurchase::class => [
        //     SendNotifyRequestCreditPurchase::class
        // ],
        // UpdateCreditPurchase::class => [
        //     SendNotifyUpdateCreditPurchase::class
        // ]
    ];

    /**
     * Register any events for your application.
     *
     * @return void
     */
    public function boot(){
        parent::boot();
    }
}
