<?php

namespace Modules\Sms\Core\Drivers;
use Modules\Sms\Core\Exceptions\SmsException;
use phpDocumentor\Reflection\DocBlock\Tags\Throws;

class BdDriver extends Driver {


    protected $config;

    public function __construct($config)
    {
        $this->config = $config;
    }

    public function send()
    {
    	$data = [
    		'from'=>$this->config['from'],
		    'message'=>$this->message,
		    'number'=>$this->recipient,
		    'url'=>$this->config['url'],
		    'api_key'=>$this->config['key'],
		    'senderid'=>$this->config['sid'],
	    ];


	    $curl = $this->bdCurl($data);
	    $result = json_decode($curl,true);
	    if(!empty($result['messages'][0]['error-text'])){
	    	throw  new SmsException($result['messages'][0]['error-text']);
	    }
	    return $result;
    }

    // $url = "http://139.99.39.237/api/smsapi";
    // $api_key = "{your api key}";
    // $senderid = "{your sender id}";
    // $number = "88016xxxxxxxx,88019xxxxxxxx";
    // $message = "test sms check";

    // $data = [
    //     "api_key" => $api_key,
    //     "senderid" => $senderid,
    //     "number" => $number,
    //     "message" => $message
    // ];
    // $ch = curl_init();
    // curl_setopt($ch, CURLOPT_URL, $url);
    // curl_setopt($ch, CURLOPT_POST, 1);
    // curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
    // curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    // curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    // $response = curl_exec($ch);
    // curl_close($ch);
    // return $response;


    public function bdCurl($data){

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->config['url']);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        $response = curl_exec($ch);
        curl_close($ch);
        return $response;

	    // $ch = curl_init();
	    // curl_setopt($ch, CURLOPT_AUTOREFERER, TRUE);
	    // curl_setopt($ch, CURLOPT_HEADER, 0);
	    // curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	    // curl_setopt($ch, CURLOPT_URL, $this->config['url']);
	    // curl_setopt($ch, CURLOPT_FOLLOWLOCATION, TRUE);
	    // curl_setopt($ch, CURLOPT_POST, count($data));
	    // curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
	    // curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));
	    // $result = curl_exec($ch);
	    // curl_close($ch);
	    // return $result;
	}


}
