<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFlightBookingTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('flight_booking', function (Blueprint $table) {
            $table->increments('id');/*
 － From: Danh sách các thành phố đi.
－ To: Danh sách các thành phố đến.
－ Departure: Ngày đi.
－ Kiểu đi (one way: Một chiều, Return: Khứ hồi)
－ Return: ngày về (Yêu cầu chọn khi đi khứ hồi)
－ Total Person: Số người đi
－ Flight class: Hạng vé (Economy Flex, Economy Standard, Business)*/
            $table->unsignedInteger('from');
            $table->unsignedInteger('to');
            $table->unsignedInteger('flight_id');
            $table->timestamp('departure');
            $table->integer('flight_type');
            $table->timestamp('return')->nullable();
            $table->integer('total_person');
            $table->unsignedInteger('user_id');
            $table->unsignedInteger('flight_class_id');
        
            $table->foreign('user_id')->references('id')->on('users');
            $table->foreign('flight_class_id')->references('id')->on('flight_class');
            $table->foreign('flight_id')->references('id')->on('flight');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('flight_booking');
    }
}
