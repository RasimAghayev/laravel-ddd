<?php

use DDD\Http\Controllers\API\AuditLogController;
use DDD\Http\Controllers\API\CarController;
use DDD\Http\Controllers\API\InvoiceController;
use DDD\Http\Controllers\API\NotificationController;
use DDD\Http\Controllers\API\OrderController;
use DDD\Http\Controllers\API\PaymentController;
use DDD\Http\Controllers\API\ProductController;
use DDD\Http\Controllers\API\UserController;
use Illuminate\Support\Facades\Route;

Route::prefix('v1')->group(function () {
    Route::apiResource('cars', CarController::class);
    Route::apiResource('users', UserController::class);
    Route::apiResource('orders', OrderController::class);
    Route::apiResource('products', ProductController::class);
    Route::apiResource('audit-logs', AuditLogController::class)->only(['index', 'store', 'show']);
    Route::apiResource('invoices', InvoiceController::class);
    Route::apiResource('payments', PaymentController::class);
    Route::apiResource('notifications', NotificationController::class);

    Route::get('/health', function () {
        return response()->json(['status' => 'ok']);
    });
});
