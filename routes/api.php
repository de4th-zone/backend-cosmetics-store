<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\TagController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\CommentController;

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

Route::group(['middleware' => 'cors'], function(){
    Route::post('users/login', [AuthController::class, 'login']);
    Route::post('users/register', [AuthController::class, 'register']);
    Route::get('users', [AuthController::class, 'listUser']);
    Route::get('users/{user_name}', [AuthController::class, 'singleUser']);
    //
    Route::get('products', [ProductController::class, 'listProduct']);
    Route::get('products/{slug}', [ProductController::class, 'singleProduct']);
    //
    Route::get('tags', [TagController::class, 'listTag']);
    Route::get('tags/{slug}', [TagController::class, 'singleTag']);
    //
    Route::get('categories', [CategoryController::class, 'listCategory']);
    Route::get('categories/{slug}', [CategoryController::class, 'singleCategory']);
    //
    Route::get('comments/{post_slug}', [CommentController::class, 'listComment']);
});

Route::group(['middleware' => ['auth:api', 'cors']], function(){
    Route::get('users/logout', [AuthController::class, 'logout']);
    Route::get('user', [AuthController::class, 'user']);
});
