<?php

namespace Modules\Agent\Listeners;

use Illuminate\Support\Facades\Mail;
use Modules\Agent\Emails\UserVerificationSubmitToAdmin;
use Modules\Agent\Events\AgentVerificationSubmit;

class SendUserSubmitVerifyDataEmail
{

    /**
     * Handle the event.
     *
     * @param $event UserVerificationSubmit
     * @return void
     */
    public function handle(AgentVerificationSubmit $event)
    {
        if (!empty(setting_item('admin_email'))) {

            Mail::to(setting_item('admin_email'))->send(new UserVerificationSubmitToAdmin($event->user));
        }

    }

}
