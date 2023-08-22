<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCashesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cashes', function (Blueprint $table) {
            $table->id();
            $table->enum('type', ['ticket', 'coin', 'cent']);
            $table->enum('nominal', [1, 5, 10, 50, 100]);
            $table->integer('quantity')->default(0);
            $table->unsignedBigInteger('fund_id');
            $table->foreign('fund_id')->references('id')->on('funds')->onDelete('cascade');
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
        Schema::dropIfExists('cashes');
    }
}
