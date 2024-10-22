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
            $table->string('destination_id')->nullable()->after('id');
            $table->string('image')->nullable();
            $table->string('available_dates')->nullable();
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
            $table->dropColumn('destination_id');
            $table->dropColumn('image');
            $table->dropColumn('available_dates');
        });
    }
};
