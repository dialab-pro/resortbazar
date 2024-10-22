<?php

namespace Modules\Boat\Models;

use App\BaseModel;

class BoatBookingCabin extends BaseModel
{
    protected $table="boat_booking_cabins";
    protected $guarded = ['id'];

    public function boatCabin(){
        return $this->belongsTo(BoatCabin::class,'cabin_id');
    }


    public function boatBooking()
    {
        return $this->belongsTo(BoatBooking::class, 'boat_booking_id');
    }
}
