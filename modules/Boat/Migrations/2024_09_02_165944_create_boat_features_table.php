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
        Schema::create('boat_features', function (Blueprint $table) {
            $table->id();
            $table->string('boat_id')->nullable();
            $table->string('title')->nullable();
            $table->string('description')->nullable();
            $table->string('status')->nullable()->default('1');
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
        Schema::dropIfExists('boat_features');
    }
};
