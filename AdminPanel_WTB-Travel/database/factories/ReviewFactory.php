<?php

namespace Database\Factories;

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
            'user_id' => User::factory(),
            'place_id' => 2,
            'rating' => 5,
            'comment' => 'mantul',
        ];
    }
}
