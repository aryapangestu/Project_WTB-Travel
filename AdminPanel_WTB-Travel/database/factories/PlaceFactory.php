<?php

namespace Database\Factories;

use App\Models\Category;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Place>
 */
class PlaceFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'src' => $this->faker->image(public_path('storage\place-img'), 640, 480, 'places', true, true, 'Bandung'),
            'name' => $this->faker->streetName,
            'description' => $this->faker->paragraph($nbSentences = 3, $variableNbSentences = true),
            'lat' => $this->faker->latitude($min = -90, $max = 90),
            'lng' => $this->faker->longitude($min = -180, $max = 180),
            'category_id' => Category::factory(),
            'status' => $this->faker->boolean(),
        ];
    }
}
