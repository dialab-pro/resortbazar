<?php

namespace Modules\Boat\Models;

use App\BaseModel;

class BoatCabin extends BaseModel
{
    protected $table = 'boat_cabins';
    protected $guarded = ['id'];

    public function boat()
    {
        return $this->belongsTo(Boat::class, 'boat_id');
    }
}