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
        Schema::create('ulasans', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('pengguna_id')->default(null);
            $table->unsignedBigInteger('tempat_wisata_id')->default(null);
            $table->integer('rating')->default(null);
            $table->string('comment', 500)->default(null);
            $table->timestamps();

            // Indexes
            $table->foreign('pengguna_id')->references('id')->on('penggunas');
            $table->foreign('tempat_wisata_id')->references('id')->on('tempat_wisatas');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('ulasans');
    }
};
