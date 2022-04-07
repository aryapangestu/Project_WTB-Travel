<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('places', function (Blueprint $table) {
            $table->id();
            $table->string('src');
            $table->string('name', 255);
            $table->longText('description');
            $table->double('lat', 15, 8)->default(null);
            $table->double('lng', 15, 8)->default(null);
            $table->unsignedBigInteger('category_id');
            $table->integer('view')->default(0);
            $table->integer('status')->default(1);
            $table->timestamps();

            $table->foreign('category_id')->references('id')->on('categories');
        });
        // Insert akun admin
        DB::table('places')->insert(
            array(
                'src' => 'place-img/gedungsate.jpg',
                'name' => 'Gedung Sate',
                'description' => 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus quas odit ex veritatis, ipsa rerum, doloremque quia culpa hic, ab neque fuga et. Itaque adipisci accusantium facere, repellat consectetur facilis!',
                'lat' => -6.913890,
                'lng' => 107.596870,
                'category_id' => 3,
                'status' => 1,
            )
        );
        DB::table('places')->insert(
            array(
                'src' => 'place-img/museumgeologi.jpg',
                'name' => 'Museum Geologi',
                'description' => 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus quas odit ex veritatis, ipsa rerum, doloremque quia culpa hic, ab neque fuga et. Itaque adipisci accusantium facere, repellat consectetur facilis!',
                'lat' => -6.9007162,
                'lng' => 107.6192666,
                'category_id' => 2,
                'status' => 0,
            )
        );
        DB::table('places')->insert(
            array(
                'src' => 'place-img/museumasaf.jpg',
                'name' => 'Museum Konfrensi Asia Afrika',
                'description' => 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus quas odit ex veritatis, ipsa rerum, doloremque quia culpa hic, ab neque fuga et. Itaque adipisci accusantium facere, repellat consectetur facilis!',
                'lat' => -6.9213389,
                'lng' => 107.608465,
                'category_id' => 2,
                'status' => 1,
            )
        );
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('places');
    }
};
