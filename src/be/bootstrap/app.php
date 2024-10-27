<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web:[
            __DIR__.'/../routes/web.php',
            __DIR__.'/../routes/users.php',
            __DIR__.'/../routes/admin.php',
        ],
        api: __DIR__.'/../routes/api.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(/**
     * @param Middleware $middleware
     * @return void
     */ callback: function (Middleware $middleware) {
        //
    })
    ->withExceptions(/**
     * @param Exceptions $exceptions
     * @return void
     */ using: function (Exceptions $exceptions) {
        //
    })->create();
