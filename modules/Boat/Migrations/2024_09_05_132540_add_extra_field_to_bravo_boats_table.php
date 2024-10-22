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
        Schema::table('bravo_boats', function (Blueprint $table) {
            $table->string('boat_start_time')->nullable();
            $table->string('rest_days')->nullable();
            $table->string('not_available_days')->nullable();
            $table->string('banner_image')->nullable();


        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('bravo_boats', function (Blueprint $table) {
            $table->dropColumn('boat_start_time');
            $table->dropColumn('rest_days');
            $table->dropColumn('not_available_days');
            $table->dropColumn('banner_image');


        });
    }
};
