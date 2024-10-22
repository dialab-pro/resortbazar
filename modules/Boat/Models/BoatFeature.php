<?php

namespace Modules\Boat\Models;

use App\BaseModel;

class BoatFeature extends BaseModel
{
    protected $table = 'boat_features';
    protected $guarded = ['id'];


    public function boat()
    {
        return $this->belongsTo(Boat::class, 'boat_id');
    }
}
