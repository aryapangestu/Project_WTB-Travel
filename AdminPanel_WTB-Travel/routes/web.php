<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\PlaceController;
use App\Http\Controllers\UserController;

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

// Route::get('/', function () {
//     return view('index', [
//         "title" => "Dashboard"
//     ]);
// });

// Route::get('/places', function () {
//     return view('places', [
//         "title" => "Places"
//     ]);
// });

Route::get('/login', [LoginController::class, 'index'])->name('login')->middleware('guest');
Route::post('/login', [LoginController::class, 'authenticate']);
Route::post('/logout', [LoginController::class, 'logout'])->middleware('auth');

Route::get('/', [DashboardController::class, 'index'])->middleware('auth');
Route::get('/dashboard', [DashboardController::class, 'index'])->middleware('auth');

Route::get('/places', [PlaceController::class, 'index'])->middleware('auth');
Route::post('/places/store', [PlaceController::class, 'store'])->middleware('auth');
Route::delete('/places/{id}', [PlaceController::class, 'destroy'])->middleware('auth');
Route::get('/places/create', [PlaceController::class, 'create'])->middleware('auth');

Route::get('/users', [UserController::class, 'index'])->middleware('auth');
