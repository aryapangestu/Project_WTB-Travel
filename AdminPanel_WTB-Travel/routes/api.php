<?php

use App\Http\Controllers\API\CategoryController;
use App\Http\Controllers\API\AuthenticationController;
use App\Http\Controllers\API\PlaceController;
use App\Http\Controllers\API\ReviewController;
use App\Http\Controllers\API\UserController;
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
    Route::get('/user', [UserController::class, 'index']);
    Route::post('/reviews', [ReviewController::class, 'storeReview']);
    Route::put('/user/updateUsername/{id}', [UserController::class, 'updateUsername']);
    Route::put('/user/updatePassword/{id}', [UserController::class, 'updatePassword']);
});

Route::get('/places', [PlaceController::class, 'index']);
Route::get('/search/{name}', [PlaceController::class, 'search']);

Route::post('/categories', [AuthenticationController::class, 'logout']);
Route::get('/categories', [CategoryController::class, 'index']);
Route::get('/categories/places/{id}', [CategoryController::class, 'placeCategory']);

Route::get('/reviews', [ReviewController::class, 'index']);
Route::get('/reviews/{id}', [ReviewController::class, 'getReview']);
