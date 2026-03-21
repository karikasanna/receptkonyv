<?php

namespace App\Http\Controllers;

use App\Models\Recipe;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class RecipeController extends Controller
{
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name'             => 'required|string|max:50',
            'cat_id'           => 'required|integer|exists:categories,id',
            'img_source'       => 'nullable|string|max:200',
            'description'      => 'nullable|string|max:500',
        ]);

        DB::table('recipes')->insert($validated);

        return response()->json(['message' => 'Sikeresen hozzáadtad a receptet.'], 201);
    }

    public function allRecipes()
    {
        $recipes = DB::table('recipes')
            ->join('categories', 'recipes.cat_id', '=', 'categories.id')
            ->select(
                'recipes.id as recipe_id',
                'recipes.name as recipe_name',
                'recipes.cat_id as cat_id',
                'categories.name as cat_name',
                'recipes.img_source',
                'recipes.description',
            )
            ->groupBy('recipes.id', 'recipes.name', 'recipes.cat_id', 'categories.name', 'recipes.img_source', 'recipes.description')
            ->get();

        return $recipes;
    }

    public function recipesByCategories($id)
    {
        $recipes = DB::table('recipes')
            ->select(
                'recipes.id as recipe_id',
                'recipes.name as recipe_name',
                'recipes.cat_id as cat_id',
                'recipes.img_source',
                'recipes.description',
            )
            ->where('recipes.cat_id', '=', $id)
            ->groupBy('recipes.id', 'recipes.name', 'recipes.cat_id', 'recipes.img_source', 'recipes.description')
            ->get();

        return $recipes;
    }

    public function destroy(string $id)
    {
        $recipe = Recipe::find($id);

        if (!$recipe){
            return response()->json([
                'message' => 'Nincs ilyen recept.'
            ], 404);
        }

        $recipe->delete();
        return response()->json([
            'message'=>'Recept sikeresen törölve.'
        ], 200);

    }
}
