<?php

use App\Http\Controllers\API\CategoryController;
use App\Http\Controllers\API\LoginController;
use App\Http\Controllers\API\PlaceController;
use App\Http\Controllers\API\ReviewController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->group(function () {
//     Route::apiResource('places', PlaceController::class);
// });

Route::apiResource('places', PlaceController::class);
Route::apiResource('reviews', ReviewController::class);
Route::apiResource('categories', CategoryController::class);
Route::post('/login', [LoginController::class, 'login']);