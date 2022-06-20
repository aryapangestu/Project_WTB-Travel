<?php

use App\Http\Controllers\API\CategoryController;
use App\Http\Controllers\API\AuthenticationController;
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

Route::post('/login', [AuthenticationController::class, 'login']);
Route::post('/register', [AuthenticationController::class, 'register']);
Route::middleware('auth:api')->group(function () {
    Route::post('/logout', [AuthenticationController::class, 'logout']);
});

Route::apiResource('places', PlaceController::class);
Route::apiResource('reviews', ReviewController::class);
Route::apiResource('categories', CategoryController::class);
