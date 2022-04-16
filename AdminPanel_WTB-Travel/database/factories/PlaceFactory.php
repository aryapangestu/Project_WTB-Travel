<?php

namespace Database\Factories;

use App\Models\Category;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Http\File;
use Illuminate\Support\Facades\Storage;

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
        $image = $this->faker->image();
        $imageFile = new File($image);
        return [
            'src' => Storage::disk('public')->put('place-img', $imageFile),
            'name' => $this->faker->streetName,
            'description' => $this->faker->paragraph($nbSentences = 3, $variableNbSentences = true),
            'lat' => $this->faker->latitude($min = -90, $max = 90),
            'lng' => $this->faker->longitude($min = -180, $max = 180),
            'category_id' => Category::factory(),
            'status' => $this->faker->boolean(),
        ];
    }
}
