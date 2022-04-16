<?php

namespace Database\Factories;

use App\Models\Place;
use App\Models\User;
use Dotenv\Util\Str;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Review>
 */
class ReviewFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'user_id' => User::all(['id'])->random(),
            'place_id' => Place::all(['id'])->random(),
            'rating' => $this->faker->numberBetween(1, 5),
            'comment' => $this->faker->paragraph(5),
        ];
    }
}
