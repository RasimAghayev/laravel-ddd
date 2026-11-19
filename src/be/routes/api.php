<?php

use DDD\Http\Controllers\API\CarController;
use DDD\Http\Controllers\API\UserController;
use Illuminate\Support\Facades\Route;

Route::prefix('v1')->group(function () {
    Route::apiResource('cars', CarController::class);
    Route::apiResource('users', UserController::class);

    Route::get('/health', function () {
        return response()->json(['status' => 'ok']);
    });
});
