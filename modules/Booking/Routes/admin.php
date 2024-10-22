<?php
use Illuminate\Support\Facades\Route;

// Booking
Route::group(['prefix'=> 'manual'],function(){

    Route::get('/make','BookingController@manualBooking')->name('booking.manual');

    Route::post('/addToCart','BookingController@addToCart');

    Route::get('/{code}/checkout','BookingController@checkout')->name('admin.booking.checkout');

    Route::get('{code}/invoice','BookingController@bookingInvoice')->name('admin.booking.invoice');
    Route::get('{code}/ticket','BookingController@ticket')->name('admin.booking.ticket');

    Route::post('/doCheckout','BookingController@doCheckout')->name('admin.booking.doCheckout');

    Route::get('/confirm/{gateway}','BookingController@confirmPayment')->name('admin.booking.confirm-payment');
    Route::get('/cancel/{gateway}','BookingController@cancelPayment');
    Route::get('/detail/{code}','BookingController@detail');
    Route::get('/{code}/check-status','BookingController@checkStatusCheckout');



    Route::get('/hotel/search', 'AdminManualHotelController@index')->name('admin.hotel.search'); // Search
    Route::get('/hotel/{slug}', 'AdminManualHotelController@detail')->name('admin.hotel.detail');// Detail



    Route::get('/make','BookingController@manualBooking')->name('booking.manual');

});
