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
        Schema::create('boat_schedules', function (Blueprint $table) {
            $table->id();
            $table->string('boat_id')->nullable();
            $table->string('ghat_leaving_date')->nullable();
            $table->string('ghat_leaving_time')->nullable();
            $table->string('ghat_available_date')->nullable();
            $table->string('next_ghat_leaving_date')->nullable();
            $table->string('rest_start_date')->nullable();
            $table->string('rest_end_date')->nullable();
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
        Schema::dropIfExists('boat_schedules');
    }
};
