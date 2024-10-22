<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('boat_bookings', function (Blueprint $table) {
            $table->id();
            $table->string('boat_id')->nullable();
            $table->string('destination_id')->nullable();
            $table->string('user_id')->nullable();
            $table->string('cabin_ids')->nullable();
            $table->string('booking_date')->nullable();
            $table->string('subtotal')->nullable();
            $table->string('discount_amount')->nullable();
            $table->string('total_amount')->nullable();
            $table->string('booking_status')->nullable();
            $table->string('payment_status')->nullable();
            $table->string('booking_id')->nullable();
            $table->string('booked_date')->nullable();
            $table->string('booked_time')->nullable();
            $table->string('create_user')->nullable();
            $table->string('update_user')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('boat_bookings');
    }
};
