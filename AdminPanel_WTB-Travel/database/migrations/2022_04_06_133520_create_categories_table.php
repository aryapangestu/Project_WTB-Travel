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
            $table->string('name_category')->unique;
            $table->timestamps();
        });
        DB::table('categories')->insert(
            array(
                'name_category' => 'Zoo',
            )
        );
        DB::table('categories')->insert(
            array(
                'name_category' => 'Museum',
            )
        );
        DB::table('categories')->insert(
            array(
                'name_category' => 'Landmark',
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
