<?php

namespace Modules\Sms\Core;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Manager;
use Modules\Sms\Core\Drivers\BdDriver;
use Modules\Sms\Core\Drivers\NexmoDriver;
use Modules\Sms\Core\Drivers\NullDriver;
use Modules\Sms\Core\Drivers\TwilioDriver;

class SmsManager extends Manager
{
	public function channel($name = null)
    {
        return $this->driver($name);
    }


    public function createNexmoDriver()
    {
	    \config()->set('sms.nexmo.key',setting_item('sms_nexmo_api_key',\config('sms.nexmo.key')));
	    \config()->set('sms.nexmo.secret',setting_item('sms_nexmo_api_secret',\config('sms.nexmo.secret')));
	    \config()->set('sms.nexmo.from',setting_item('sms_nexmo_api_from',\config('sms.nexmo.from')));
        return new NexmoDriver(config('sms.nexmo'));
    }
	public function createTwilioDriver()
	{
		\config()->set('sms.twilio.from',setting_item('sms_twilio_api_from',\config('sms.twilio.from')));
		\config()->set('sms.twilio.sid',setting_item('sms_twilio_account_sid',\config('sms.twilio.sid')));
		\config()->set('sms.twilio.token',setting_item('sms_twilio_account_token',\config('sms.twilio.token')));
		return new TwilioDriver(config('sms.twilio'));
	}

	public function createBdDriver(){

		\config()->set('sms.bd.url',setting_item('sms_bd_url',\config('sms.bd.url')));
		\config()->set('sms.bd.key',setting_item('sms_bd_api_key',\config('sms.bd.key')));
		\config()->set('sms.bd.from',setting_item('sms_bd_account_sid',\config('sms.bd.from')));
		\config()->set('sms.bd.sid',setting_item('sms_bd_api_from',\config('sms.bd.sid')));
		return new BdDriver(config('sms.bd'));
	}


	public function createLogDriver()
	{

		return new NullDriver;

	}

    public function createNullDriver()
    {

        return new NullDriver;
    }

    /**
     * Get the default SMS driver name.
     *
     * @return string
     */
    public function getDefaultDriver()
    {
	    $channel = setting_item('sms_driver');
	    Config::set('sms.default', $channel);
	    return config('sms.default','');
    }
}
