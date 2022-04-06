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
        Schema::create('categories', function (Blueprint $table) {
            $table->id();
            $table->string('name')->unique;
            $table->timestamps();
        });
        DB::table('categories')->insert(
            array(
                'name' => 'Zoo',
            )
        );
        DB::table('categories')->insert(
            array(
                'name' => 'Museum',
            )
        );
        DB::table('categories')->insert(
            array(
                'name' => 'Landmark',
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
        Schema::dropIfExists('categories');
    }
};
