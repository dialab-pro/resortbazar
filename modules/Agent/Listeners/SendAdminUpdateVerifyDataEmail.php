<?php

namespace Modules\Agent\Listeners;

use Illuminate\Support\Facades\Mail;

use Modules\Agent\Emails\AdminUpdateVerifyDataToUser;
use Modules\Agent\Events\AdminUpdateVerificationData;


class SendAdminUpdateVerifyDataEmail {

    public function __construct() {

    }

    /**
     * Handle the event.
     *
     * @param $event AdminUpdateVerificationData
     * @return void
     */
    public function handle(AdminUpdateVerificationData $event)
    {
        Mail::to($event->user->email)->send(new AdminUpdateVerifyDataToUser($event->user,$event->is_update_full));

    }

}
