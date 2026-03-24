<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RecipeController;
use Illuminate\Support\Facades\DB;

Route::get('/recipes', [RecipeController::class, 'allRecipes']);
Route::get('/recipes/{id}', [RecipeController::class, 'oneRecipe']);
Route::get('/category-{id}', [RecipeController::class, 'recipesByCategories']);
Route::post('/add-recipe', [RecipeController::class, 'store']);
Route::delete('/recipes/{id}', [RecipeController::class, 'destroy']);

Route::get('/categories', function () {
    return DB::table('categories')->get();
});

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');
