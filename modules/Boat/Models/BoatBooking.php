<?php

namespace Modules\Boat\Models;

use App\BaseModel;
use App\Models\User;

class BoatBooking extends BaseModel
{
    protected $table = "boat_bookings";
    protected $guarded = ['id'];


    public function boatBookingCabin()
    {
        return $this->hasMany(BoatBookingCabin::class, 'boat_booking_id');
    }

    public function boat()
    {
        return $this->belongsTo(Boat::class, 'boat_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class,'user_id');
    }
}
