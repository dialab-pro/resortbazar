<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnUsersTable extends Migration {
    /**
     * Run the migrations.
     *
     * @return void
    */
    public function up(){
        Schema::table('users', function (Blueprint $table) {
            $table->integer('agent_commission')->nullable()->after('vendor_commission_type');
            $table->string('agent_commission_type',30)->nullable()->after('agent_commission');

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
