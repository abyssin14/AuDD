<?php

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
    return view('welcome');
});

Auth::routes();
Route::get('change-password', 'ChangerPasswordController@index');
Route::post('change-password', 'ChangerPasswordController@store')->name('change.password');

Route::get('/home', 'HomeController@index')->name('home');
