<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RecipeController;


Route::get('/all-recipes', [RecipeController::class, 'allRecipes']);
Route::get('/category-{id}', [RecipeController::class, 'recipesByCategories']);
Route::post('/add-recipe', [RecipeController::class, 'store']);
Route::delete('/recipes/{id}', [RecipeController::class, 'destroy']);

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');
