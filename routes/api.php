<?php

use Illuminate\Http\Request;

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['prefix' => '/v1', 'namespace' => 'Api\v1\Header', 'as'=>'api'],function(){
    Route::get('/header', 'HeaderController@index');
});



Route::group(['prefix' => 'auth', 'namespace' => 'Api\v1', 'as'=>'api'],function(){
Route::post('/register', 'AuthController@register');
Route::post('/login', 'AuthController@login');
Route::post('/logout', 'AuthController@logout');
});


Route::group(['prefix' =>'/v1', 'namespace' => 'Api\v1', 'as'=>'api'],function(){
    Route::resource('posts','PostsController', ['except'=>['create', 'edit']]);
    Route::resource('images', 'ImageController', ['except'=>['create', 'edit']]);

});
