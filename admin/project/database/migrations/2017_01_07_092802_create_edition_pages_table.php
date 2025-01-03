<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEditionPagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('edition_pages', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('edition_id')->unsigned();
            $table->integer('page_id')->unsigned();

            $table->foreign('edition_id')->references('id')->on('editions');
            $table->foreign('page_id')->references('id')->on('pages');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('edition_pages');
    }
}
