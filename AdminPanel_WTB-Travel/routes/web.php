<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\PlaceController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ReviewController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//Login
Route::get('/login', [LoginController::class, 'index'])->name('login')->middleware('guest');
Route::post('/login', [LoginController::class, 'authenticate']);
Route::post('/logout', [LoginController::class, 'logout'])->middleware('auth');

//Dashboard
Route::get('/', [DashboardController::class, 'index'])->middleware('auth');
Route::get('/dashboard', [DashboardController::class, 'index'])->middleware('auth');

//Places
Route::get('/places', [PlaceController::class, 'index'])->middleware('auth');
Route::post('/places/store', [PlaceController::class, 'store'])->middleware('auth');
Route::delete('/places/{id}', [PlaceController::class, 'destroy'])->middleware('auth');
Route::put('/places/{id}', [PlaceController::class, 'update'])->middleware('auth');
Route::post('/places/status/{id}', [PlaceController::class, 'updatePlaceStatus'])->middleware('auth');
Route::get('/places/create', [PlaceController::class, 'create'])->middleware('auth');
Route::get('/places/{id}/edit', [PlaceController::class, 'edit'])->middleware('auth');
Route::get('/places/{id}/view', [PlaceController::class, 'show'])->middleware('auth');

//User
Route::get('/users', [UserController::class, 'index'])->middleware('auth');
Route::get('/users/create', [UserController::class, 'create'])->middleware('auth');
Route::post('/users/store', [UserController::class, 'store'])->middleware('auth');
Route::delete('/users/{id}', [UserController::class, 'destroy'])->middleware('auth');
Route::post('/users/status/{id}', [UserController::class, 'updateUserStatus'])->middleware('auth');
Route::post('/users/admin/{id}', [UserController::class, 'updateUserAdmin'])->middleware('auth');

//Category
Route::get('/categories', [CategoryController::class, 'index'])->middleware('auth');
Route::get('/categories/create', [CategoryController::class, 'create'])->middleware('auth');
Route::post('/categories/store', [CategoryController::class, 'store'])->middleware('auth');
Route::get('/categories/{id}/edit', [CategoryController::class, 'edit'])->middleware('auth');
Route::put('/categories/{id}', [CategoryController::class, 'update'])->middleware('auth');
Route::delete('/categories/{id}', [CategoryController::class, 'destroy'])->middleware('auth');

//Review
Route::get('/reviews', [ReviewController::class, 'index'])->middleware('auth');
Route::get('/reviews/create', [ReviewController::class, 'create'])->middleware('auth');
Route::post('/reviews/store', [ReviewController::class, 'store'])->middleware('auth');
Route::get('/reviews/{id}/edit', [ReviewController::class, 'edit'])->middleware('auth');
Route::put('/reviews/{id}', [ReviewController::class, 'update'])->middleware('auth');
Route::delete('/reviews/{id}', [ReviewController::class, 'destroy'])->middleware('auth');
