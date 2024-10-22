<?php

use \Illuminate\Support\Facades\Route;


// Boat Destination
Route::get('/boat_destination', 'BoatController@boatDestination')->name('boat.admin.destination');
Route::get('/boat_destination/create', 'BoatController@boatDestinationCreate')->name('boat.admin.destinationCreate');
Route::post('/boat_destination/store', 'BoatController@boatDestinationStore')->name('boat.admin.destinationStore');
Route::get('/boat_destination/edit/{id}', 'BoatController@boatDestinationEdit')->name('boat.admin.destinationEdit');
Route::post('/boat_destination/update/{id}', 'BoatController@boatDestinationUpdate')->name('boat.admin.destinationUpdate');
Route::get('/boat_destination/delete/{id}', 'BoatController@boatDestinationDelete')->name('boat.admin.destinationDelete');

// Boat route
Route::get('/', 'BoatController@index')->name('boat.admin.index');
Route::get('/create', 'BoatController@create')->name('boat.admin.create');
Route::get('/edit/{id}', 'BoatController@edit')->name('boat.admin.edit');
Route::post('/store', 'BoatController@store')->name('boat.admin.store');
Route::post('/update/{id}', 'BoatController@update')->name('boat.admin.update');
Route::get('/delete/{id}', 'BoatController@delete')->name('boat.admin.delete');
Route::get('/boat-cabin', 'BoatController@boatCabin')->name('boatCabin.admin.index');
Route::get('/boat-cabin-create', 'BoatController@boatCabinCreate')->name('boatCabin.admin.create');
Route::post('/boat-cabin-store', 'BoatController@boatCabinStore')->name('boatCabin.admin.store');
Route::get('/boat-cabin-edit/{id}', 'BoatController@boatCabinEdit')->name('boatCabin.admin.edit');
Route::post('/boat-cabin-update/{id}', 'BoatController@boatCabinUpdate')->name('boatCabin.admin.update');
Route::get('/boat-cabin-delete/{id}', 'BoatController@boatCabinDelete')->name('boatCabin.admin.delete');
Route::post('/bulkEdit', 'BoatController@bulkEdit')->name('boat.admin.bulkEdit');
Route::get('/recovery', 'BoatController@recovery')->name('boat.admin.recovery');
Route::get('/getForSelect2', 'BoatController@getForSelect2')->name('boat.admin.getForSelect2');

// Feature
Route::get('/feature', 'FeatureController@index')->name('feature.admin.index');
Route::get('/feature/create', 'FeatureController@create')->name('feature.admin.create');
Route::post('/feature/store', 'FeatureController@store')->name('feature.admin.store');
Route::get('/feature/edit/{id}', 'FeatureController@edit')->name('feature.admin.edit');
Route::post('/feature/update/{id}', 'FeatureController@update')->name('feature.admin.update');
Route::get('/feature/delete/{id}', 'FeatureController@delete')->name('feature.admin.delete');

//Schedule
Route::get('/schedule', 'ScheduleController@index')->name('schedule.admin.index');
Route::get('/schedule/create', 'ScheduleController@create')->name('schedule.admin.create');
Route::post('/schedule/store', 'ScheduleController@store')->name('schedule.admin.store');
Route::get('/schedule/edit/{id}', 'ScheduleController@edit')->name('schedule.admin.edit');
Route::post('/schedule/update/{id}', 'ScheduleController@update')->name('schedule.admin.update');
Route::get('/schedule/delete/{id}', 'ScheduleController@delete')->name('schedule.admin.delete');


// Booking
Route::get("/booking", "BookingController@index")->name('booking.admin.index');
Route::get("/booking/view/{id}", "BookingController@view")->name('booking.admin.view');
Route::get("/booking/print-invoice/{id}", "BookingController@printInvoice")->name('booking.admin.printInvoice');
Route::get("/booking/delete/{id}", "BookingController@delete")->name('booking.admin.delete');

Route::group(['prefix' => 'attribute'], function () {
    Route::get('/', 'AttributeController@index')->name('boat.admin.attribute.index');
    Route::get('/edit/{id}', 'AttributeController@edit')->name('boat.admin.attribute.edit');
    Route::post('/store/{id}', 'AttributeController@store')->name('boat.admin.attribute.store');
    Route::post('/editAttrBulk', 'AttributeController@editAttrBulk')->name('boat.admin.attribute.editAttrBulk');

    Route::get('/terms/{id}', 'AttributeController@terms')->name('boat.admin.attribute.term.index');
    Route::get('/term_edit/{id}', 'AttributeController@term_edit')->name('boat.admin.attribute.term.edit');
    Route::post('/term_store', 'AttributeController@term_store')->name('boat.admin.attribute.term.store');
    Route::post('/editTermBulk', 'AttributeController@editTermBulk')->name('boat.admin.attribute.term.editTermBulk');

    Route::get('/getForSelect2', 'AttributeController@getForSelect2')->name('boat.admin.attribute.term.getForSelect2');
});

Route::group(['prefix' => 'availability'], function () {
    Route::get('/', 'AvailabilityController@index')->name('boat.admin.availability.index');
    Route::get('/loadDates', 'AvailabilityController@loadDates')->name('boat.admin.availability.loadDates');
    Route::post('/store', 'AvailabilityController@store')->name('boat.admin.availability.store');
});
