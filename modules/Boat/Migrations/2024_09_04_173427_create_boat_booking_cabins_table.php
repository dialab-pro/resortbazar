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
        Schema::create('boat_booking_cabins', function (Blueprint $table) {
            $table->id();
            $table->string('boat_booking_id')->nullable();
            $table->string('boat_id')->nullable();
            $table->string('cabin_id')->nullable();
            $table->string('user_id')->nullable();
            $table->string('cabin_price')->nullable();
            $table->string('booking_date')->nullable();
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
        Schema::dropIfExists('boat_booking_cabins');
    }
};
