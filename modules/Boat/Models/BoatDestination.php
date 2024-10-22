<?php

namespace Modules\Boat\Models;

use App\BaseModel;

class BoatDestination extends BaseModel
{
    protected $table = 'boat_destination';

    protected $guarded = ['id'];


    public function boat(){
        return $this->hasMany(Boat::class, 'destination_id');
    }
}
