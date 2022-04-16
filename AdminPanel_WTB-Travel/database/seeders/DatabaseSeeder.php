<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use App\Models\Category;
use App\Models\Place;
use App\Models\Review;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // User::factory(10)->create();

        Review::factory(10)->create();

        // Insert akun admin
        User::create([
            'username' => 'admin',
            'password' => Hash::make('admin'),
            'is_admin' => 1
        ]);

        // // Category
        // Category::create([
        //     'name_category' => 'Zoo',
        // ]);

        // Category::create([
        //     'name_category' => 'Museum',
        // ]);

        // Category::create([
        //     'name_category' => 'Landmark',
        // ]);

        // Category::factory(10)->create();

        // Place
        // Place::create([
        //     'src' => 'place-img/gedungsate.jpg',
        //     'name' => 'Gedung Sate',
        //     'description' => 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus quas odit ex veritatis, ipsa rerum, doloremque quia culpa hic, ab neque fuga et. Itaque adipisci accusantium facere, repellat consectetur facilis!',
        //     'lat' => -6.913890,
        //     'lng' => 107.596870,
        //     'category_id' => 3,
        //     'status' => 1,
        // ]);

        // Place::create([
        //     'src' => 'place-img/museumgeologi.jpg',
        //     'name' => 'Museum Geologi',
        //     'description' => 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus quas odit ex veritatis, ipsa rerum, doloremque quia culpa hic, ab neque fuga et. Itaque adipisci accusantium facere, repellat consectetur facilis!',
        //     'lat' => -6.9007162,
        //     'lng' => 107.6192666,
        //     'category_id' => 2,
        //     'status' => 0,
        // ]);

        // Place::create([
        //     'src' => 'place-img/museumasaf.jpg',
        //     'name' => 'Museum Konfrensi Asia Afrika',
        //     'description' => 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus quas odit ex veritatis, ipsa rerum, doloremque quia culpa hic, ab neque fuga et. Itaque adipisci accusantium facere, repellat consectetur facilis!',
        //     'lat' => -6.9213389,
        //     'lng' => 107.608465,
        //     'category_id' => 2,
        //     'status' => 1,
        // ]);
        // Place::factory(10)->create();
    }
}
