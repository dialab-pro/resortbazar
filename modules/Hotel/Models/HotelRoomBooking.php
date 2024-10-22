<?php

namespace Modules\Hotel\Models;

use App\BaseModel;
use Modules\Booking\Models\Booking;

class HotelRoomBooking extends BaseModel
{
    protected $table = 'bravo_hotel_room_bookings';


    // protected $fillable = [
    //     'title',
    //     'content',
    //     'status',
    // ];

    protected $casts = [
        'extra_prices' => 'array',
        'vendor_service_fee' => 'array',
    ];




    public function scopeInRange($query,$start,$end){
        $query->where('bravo_hotel_room_bookings.start_date','<=',$end)->where('bravo_hotel_room_bookings.end_date','>',$start);
    }

    public function scopeActive($query)
    {
        return $query->join('bravo_bookings', function ($join) {
            $join->on('bravo_bookings.id', '=', $this->table . '.booking_id');
        })->whereNotIn('bravo_bookings.status', Booking::$notAcceptedStatus)->where('bravo_bookings.deleted_at', null);
    }

    public function room(){
        return $this->hasOne(HotelRoom::class,'id','room_id')->withDefault();
    }
    public function booking(){
    	return $this->belongsTo(Booking::class,'booking_id');
    }

    public static function getByBookingId($id){
        return parent::query()->where([
            'booking_id'=>$id
        ])->get();
    }



    public function getDurationNightsAttribute(){

        $days = max(1,floor((strtotime($this->end_date) - strtotime($this->start_date)) / DAY_IN_SECONDS));

        return $days;
    }
    public function getDurationDaysAttribute(){

        $days = max(1,floor((strtotime($this->end_date) - strtotime($this->start_date)) / DAY_IN_SECONDS) + 1 );
        return $days;
    }
    public function getDurationHoursAttribute(){

        $days = max(1,floor((strtotime($this->end_date) - strtotime($this->start_date)) / HOUR_IN_SECONDS) );
        return $days;
    }

}
