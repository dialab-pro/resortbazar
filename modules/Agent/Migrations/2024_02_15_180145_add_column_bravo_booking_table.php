<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnBravoBookingTable extends Migration {
    /**
     * Run the migrations.
     *
     * @return void
    */
    public function up(){
        Schema::table('bravo_bookings', function (Blueprint $table) {
            $table->integer('agent_id')->nullable()->after('vendor_id');
            $table->decimal('agent_commission',10,2)->nullable()->after('commission_type');
            $table->string('agent_commission_type',150)->nullable()->after('agent_commission');
        });
    }


    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
};
