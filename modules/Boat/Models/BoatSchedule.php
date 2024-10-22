<?php

namespace Modules\Boat\Models;

use App\BaseModel;

class BoatSchedule extends BaseModel
{
    protected $table = 'boat_schedules';
    protected $guarded = ['id'];


    public function boat()
    {
        return $this->belongsTo(Boat::class, 'boat_id');
    }
}
