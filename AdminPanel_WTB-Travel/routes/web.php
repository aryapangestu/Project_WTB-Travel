<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\DashboardController;

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

// Route::get('/users', function () {
//     return view('users', [
//         "title" => "Users"
//     ]);
// });

Route::get('/login', [LoginController::class, 'index'])->middleware('guest');
Route::post('/login', [LoginController::class, 'authenticate']);
Route::post('/logout', [LoginController::class, 'logout']);

Route::get('/', [DashboardController::class, 'index']);
Route::get('/dashboard', [DashboardController::class, 'index']);
Route::get('/places', [PlaceController::class, 'index']);
Route::get('/users', [UserController::class, 'index']);
