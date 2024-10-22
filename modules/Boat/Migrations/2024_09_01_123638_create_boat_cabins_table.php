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
        Schema::create('boat_cabins', function (Blueprint $table) {
            $table->id();
            $table->integer('boat_id')->nullable();
            $table->string('title')->nullable();
            $table->string('slug')->nullable();
            $table->string('type')->nullable()->comment('deluxe', 'standard');
            $table->string('price')->nullable();
            $table->string('description')->nullable();
            $table->string('image')->nullable();
            $table->string('person')->nullable();
            $table->string('extra_person_fee')->nullable();
            $table->string('cabin_feature')->nullable();
            $table->string('status')->nullable()->comment('available', 'booked', 'maintence');
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
        Schema::dropIfExists('boat_cabins');
    }
};
