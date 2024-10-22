<?php
use \Illuminate\Support\Facades\Route;

Route::group(['prefix'=>'agent'],function(){
    Route::post('/register','AgentController@register')->name('agent.register');
});

Route::group(['prefix'=>'agent','middleware' => ['auth','verified']],function(){

    Route::get('/getForSelect2', 'AgentController@getForSelect2')->name('agent.getForSelect2');

    Route::match(['get'],'/dashboard','AgentController@dashboard')->name("agent.dashboard");

    Route::match(['get'],'/upgrade-agent','AgentController@upgradeAgent')->name("user.upgrade_agent");

    Route::match(['get'],'/payouts','PayoutController@index')->name("agent.payout.index");
    Route::post('/storePayoutAccounts','PayoutController@storePayoutAccounts')->name("agent.payout.storePayoutAccounts");
    Route::post('/createPayoutRequest','PayoutController@createPayoutRequest')->name("agent.payout.createPayoutRequest");

    // BookingController
    Route::prefix('booking')->group(function(){
        Route::get('/','BookingController@index')->name("agent.booking.index");
        Route::get('/make/booked','BookingController@makeBooked')->name("agent.make.booked");
        Route::post('/addToCart','BookingController@addToCart');
        Route::get('/{code}/checkout','BookingController@checkout')->name('agent.booking.checkout');

        Route::get('{code}/invoice','BookingController@bookingInvoice')->name('agent.booking.invoice');
        Route::get('{code}/ticket','BookingController@ticket')->name('agent.booking.ticket');

        Route::post('/doCheckout','BookingController@doCheckout')->name('agent.booking.doCheckout');
        Route::get('/confirm/{gateway}','BookingController@confirmPayment')->name('agent.booking.confirm-payment');
        Route::get('/cancel/{gateway}','BookingController@cancelPayment');
        Route::get('/detail/{code}','BookingController@detail');
        Route::get('/{code}/check-status','BookingController@checkStatusCheckout');


        Route::get('/hotel/search', 'AgentHotelController@index')->name('agent.hotel.search'); // Search
        Route::get('/hotel/{slug}', 'AgentHotelController@detail')->name('agent.hotel.detail');// Detail

        Route::get('/space/search', 'AgentSpaceController@index')->name('agent.space.search'); // Search
        Route::get('/space/{slug}', 'AgentSpaceController@detail')->name('agent.space.detail');// Detail

        Route::get('/tour/search', 'AgentTourController@index')->name('agent.tour.search'); // Search
        Route::get('/tour/{slug}', 'AgentTourController@detail')->name('agent.tour.detail');// Detail

        Route::get('/car/search', 'AgentCarController@index')->name('agent.car.search'); // Search
        Route::get('/car/{slug}', 'AgentCarController@detail')->name('agent.car.detail');// Detail

        Route::get('/event/search', 'AgentEventController@index')->name('agent.event.search'); // Search
        Route::get('/event/{slug}', 'AgentEventController@detail')->name('agent.event.detail');// Detail

        Route::get('/flight/search', 'AgentFlightController@index')->name('agent.flight.search'); // Search
        Route::get('/flight/{slug}', 'AgentFlightController@detail')->name('agent.flight.detail');// Detail
        Route::get('/boat/search', 'AgentBoatController@index')->name('agent.boat.search'); // Search
        Route::get('/boat/{slug}', 'AgentBoatController@detail')->name('agent.boat.detail');// Detail

    });

    // agent/booking/hotel/search
    // Route::get('/booking-report','VendorController@bookingReport')->name("vendor.bookingReport");

    // Route::prefix('team')->name('vendor.team.')->group(function(){
    //     Route::get('/','TeamController@index')->name("index");
    //     Route::post('/add','TeamController@add')->name("add");
    //     Route::get('/edit/{vendorTeam}','TeamController@edit')->name("edit");
    //     Route::get('/reSendRequest/{vendorTeam}','TeamController@reSendRequest')->name("re-send-request");
    //     Route::post('/store/{vendorTeam}','TeamController@store')->name("store");
    //     Route::get('/delete/{vendorTeam}','TeamController@delete')->name("delete")->middleware('signed');
    // });

});
