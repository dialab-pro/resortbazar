<?php

use \Illuminate\Support\Facades\Route;
use Modules\Boat\Controllers\BoatController;

Route::group(['prefix' => config('boat.boat_route_prefix')], function () {
    Route::get('/', 'BoatController@index')->name('boat.search'); // Search
    Route::get('/{slug}', 'BoatController@detail')->name('boat.detail'); // Detail

    Route::get('/front/index', [BoatController::class, 'newindex'])->name('boat.front.index');
    Route::get('/front/search-boat', [BoatController::class, 'searchBoat'])->name('boat.front.searchBoat');
    Route::get('/front/search', [BoatController::class, 'search'])->name('boat.front.search');
    Route::get('/front/boat-details/{slug}', [BoatController::class, 'boatDetails'])->name('boat.front.boatDetails');
    Route::get('/front/full-boat-details/{slug}', [BoatController::class, 'fullBoatDetails'])->name('boat.front.fullBoatDetails');
    Route::get('/front/destination-details/{slug}', [BoatController::class, 'destinationDetails'])->name('boat.front.destinationDetails');
    Route::get('/front/get-boat-cabin/{id}', [BoatController::class, 'getBoatCabinByBoatId'])->name('boat.front.getBoatCabinByBoatId');
    Route::get('/front/get-cabininfo-cabin/{id}', [BoatController::class, 'getCabinInfoByCabinId'])->name('boat.front.getCabinInfoByCabinId');
    Route::post("/front/boat/cabin-booking", [BoatController::class, 'boatCabinBooking'])->name('boat.front.boatCabinBooking');
    Route::get("/front/boat/cabin-booking/checkout/{id}", [BoatController::class, 'boatCabinBookingCheckout'])->name('boat.front.boatCabinBookingCheckout');
    Route::post("/front/boat/cabin-booking/confirm-checkout/{id}", [BoatController::class, 'boatCabinBookingConfirmCheckout'])->name('boat.front.boatCabinBookingConfirmCheckout');
    Route::post("/front/boat/schedule-checkInDate-by-checkindate", [BoatController::class, 'scheduleCheckInDateByCheckInDate'])->name('boat.front.scheduleCheckInDateByCheckInDate');

    // boat booked
    Route::post("/front/boat/boat-booking", [BoatController::class, 'boatBooking'])->name('boat.front.boatBooking');
    Route::get("/front/boat/boat-booking-print/{id}", [BoatController::class, 'boatBookingPrint'])->name('boat.front.boatBookingPrint');



    Route::get("/front/boat/cabin-booking/success/{id}", [BoatController::class, 'boatCabinBookingSuccess'])->name('boat.front.boatCabinBookingSuccess');
    Route::post("/front/boat/cabin-booking/successbypayment", [BoatController::class, 'boatCabinBookingSuccessByPayment'])->name('boat.front.boatCabinBookingSuccessByPayment');
    Route::get("/front/boat/boat-booking/successbypayment/{transId}", [BoatController::class, 'boatBookingSuccessByPayment'])->name('boat.front.boatBookingSuccessByPayment');
});

Route::group(['prefix' => 'user/' . config('boat.boat_route_prefix'), 'middleware' => ['auth', 'verified']], function () {
    Route::get('/', 'ManageBoatController@manageBoat')->name('boat.vendor.index');
    Route::get('/create', 'ManageBoatController@createBoat')->name('boat.vendor.create');
    Route::get('/edit/{id}', 'ManageBoatController@editBoat')->name('boat.vendor.edit');
    Route::get('/del/{id}', 'ManageBoatController@deleteBoat')->name('boat.vendor.delete');
    Route::post('/store/{id}', 'ManageBoatController@store')->name('boat.vendor.store');
    Route::get('bulkEdit/{id}', 'ManageBoatController@bulkEditBoat')->name("boat.vendor.bulk_edit");
    Route::get('/booking-report/bulkEdit/{id}', 'ManageBoatController@bookingReportBulkEdit')->name("boat.vendor.booking_report.bulk_edit");
    Route::get('/recovery', 'ManageBoatController@recovery')->name('boat.vendor.recovery');
    Route::get('/restore/{id}', 'ManageBoatController@restore')->name('boat.vendor.restore');
});

Route::group(['prefix' => 'user/' . config('boat.boat_route_prefix')], function () {
    Route::group(['prefix' => 'availability'], function () {
        Route::get('/', 'AvailabilityController@index')->name('boat.vendor.availability.index');
        Route::get('/loadDates', 'AvailabilityController@loadDates')->name('boat.vendor.availability.loadDates');
        Route::post('/store', 'AvailabilityController@store')->name('boat.vendor.availability.store');
        Route::get('/availabilityBooking', 'AvailabilityController@availabilityBooking')->name('boat.vendor.availability.availabilityBooking');
    });
});
