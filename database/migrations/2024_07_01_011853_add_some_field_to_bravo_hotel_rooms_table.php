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
        Schema::table('bravo_hotel_rooms', function (Blueprint $table) {
            $table->string('offer_name')->nullable();
            $table->string('discount_start_date')->nullable();
            $table->string('discount_end_date')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('bravo_hotel_rooms', function (Blueprint $table) {
            $table->dropColumn('offer_name');
            $table->dropColumn('discount_start_date');
            $table->dropColumn('discount_end_date');
        });
    }
};
