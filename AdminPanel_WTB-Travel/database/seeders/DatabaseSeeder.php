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

        // Insert akun admin
        User::create([
            'username' => 'admin',
            'password' => Hash::make('admin'),
            'is_admin' => 1
        ]);

        // End-user
        User::factory(10)->create();

        // Category
        Category::create([
            'name_category' => 'Zoo',
        ]);

        Category::create([
            'name_category' => 'Museum',
        ]);

        Category::create([
            'name_category' => 'Landmark',
        ]);

        // Place
        Place::create([
            'src' => 'place-img/U9yMFSbMXxVI45K9IGlhrtf9Ohd08EQfTCgVLRBM.jpg',
            'name' => 'Gedung Sate',
            'address' => 'Jl. Diponegoro No.22, Citarum, Kec. Bandung Wetan, Kota Bandung, Jawa Barat 40115',
            'description' => 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus quas odit ex veritatis, ipsa rerum, doloremque quia culpa hic, ab neque fuga et. Itaque adipisci accusantium facere, repellat consectetur facilis!',
            'lat' => -6.913890,
            'lng' => 107.596870,
            'view' => 170,
            'category_id' => 3,
            'status' => 1,
        ]);

        Place::create([
            'src' => 'place-img/JlbQF2Rutcd8cYguWwAHHzjTchZkfFzVwH6VITiT.jpg',
            'name' => 'Museum Geologi',
            'address' => 'Jl. Diponegoro No.57, Cihaur Geulis, Kec. Cibeunying Kaler, Kota Bandung, Jawa Barat 40122',
            'description' => 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus quas odit ex veritatis, ipsa rerum, doloremque quia culpa hic, ab neque fuga et. Itaque adipisci accusantium facere, repellat consectetur facilis!',
            'lat' => -6.9007162,
            'lng' => 107.6192666,
            'view' => 100,
            'category_id' => 2,
            'status' => 0,
        ]);

        Place::create([
            'src' => 'place-img/UMkOUw4P7XKE3h1eckeeugdKAj5zhj02omoXoOhj.jpg',
            'name' => 'Museum Konfrensi Asia Afrika',
            'address' => 'Jl. Asia Afrika No.65, Braga, Kec. Sumur Bandung, Kota Bandung, Jawa Barat 40111',
            'description' => 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus quas odit ex veritatis, ipsa rerum, doloremque quia culpa hic, ab neque fuga et. Itaque adipisci accusantium facere, repellat consectetur facilis!',
            'lat' => -6.9213389,
            'lng' => 107.608465,
            'view' => 200,
            'category_id' => 2,
            'status' => 1,
        ]);

        // Review
        Review::factory(10)->create();
    }
}
