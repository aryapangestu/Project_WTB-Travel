<?php

use Illuminate\Support\Facades\Route;

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

Route::get('/', function () {
    return view('index', [
        "title" => "Dashboard"
    ]);
});

Route::get('/login', function () {
    return view('login');
});

Route::get('/places', function () {
    return view('places', [
        "title" => "Places"
    ]);
});

Route::get('/users', function () {
    return view('users', [
        "title" => "Users"
    ]);
});
