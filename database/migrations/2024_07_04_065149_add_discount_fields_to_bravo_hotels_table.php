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
        Schema::table('bravo_hotels', function (Blueprint $table) {
            $table->string('discount_type')->nullable();
            $table->string('discount_amount')->nullable();
            $table->string('after_discount')->nullable();
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
        Schema::table('bravo_hotels', function (Blueprint $table) {
            $table->dropColumn('discount_type');
            $table->dropColumn('discount_amount');
            $table->dropColumn('after_discount');
            $table->dropColumn('discount_start_date');
            $table->dropColumn('discount_end_date');
        });
    }
};
