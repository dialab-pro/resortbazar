<?php

namespace Modules\Boat\Models;

use App\BaseModel;

class Boat extends BaseModel
{
    protected $table = 'bravo_boats';
    protected $guarded = ['id'];

    public function destination(){
        return $this->belongsTo(BoatDestination::class,'destination_id');
    }


    public function boatFeature()
    {
        return $this->hasMany(BoatFeature::class, 'boat_id');
    }


    public function boatSchedule()
    {
        return $this->hasMany(BoatSchedule::class, 'boat_id');
    }


    public function boatCabin()
    {
        return $this->hasMany(BoatCabin::class,"boat_id");
    }


}
