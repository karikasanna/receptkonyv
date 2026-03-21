<?php

namespace Database\Factories;

use App\Models\Category;
use App\Models\Recipe;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<Recipe>
 */
class RecipeFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
        'name'=>fake()->sentence(2),
        'cat_id'=>Category::all()->random()->id,
        'description'=>fake()->sentence(10),
        ];
    }
}
