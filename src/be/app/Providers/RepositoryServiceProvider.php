<?php

declare(strict_types=1);

namespace DDD\Providers;

use DDD\Application\Cars\UseCases\CreateCarUseCase;
use DDD\Application\Cars\UseCases\DeleteCarUseCase;
use DDD\Application\Cars\UseCases\GetCarUseCase;
use DDD\Application\Cars\UseCases\ListCarsUseCase;
use DDD\Application\Cars\UseCases\UpdateCarUseCase;
use DDD\Application\Users\UseCases\CreateUserUseCase;
use DDD\Application\Users\UseCases\DeleteUserUseCase;
use DDD\Application\Users\UseCases\GetUserUseCase;
use DDD\Application\Users\UseCases\ListUsersUseCase;
use DDD\Application\Users\UseCases\UpdateUserUseCase;
use DDD\Domain\Cars\Repository\CarRepositoryInterface;
use DDD\Domain\Users\Repository\UserRepositoryInterface;
use DDD\Infrastructure\Persistence\Eloquent\Cars\EloquentCarRepository;
use DDD\Infrastructure\Persistence\Eloquent\Users\EloquentUserRepository;
use Illuminate\Support\ServiceProvider;

class RepositoryServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        $this->app->bind(CarRepositoryInterface::class, EloquentCarRepository::class);
        $this->app->bind(UserRepositoryInterface::class, EloquentUserRepository::class);

        $this->app->singleton(CreateCarUseCase::class, function ($app) {
            return new CreateCarUseCase($app->make(CarRepositoryInterface::class));
        });
        $this->app->singleton(GetCarUseCase::class, function ($app) {
            return new GetCarUseCase($app->make(CarRepositoryInterface::class));
        });
        $this->app->singleton(ListCarsUseCase::class, function ($app) {
            return new ListCarsUseCase($app->make(CarRepositoryInterface::class));
        });
        $this->app->singleton(UpdateCarUseCase::class, function ($app) {
            return new UpdateCarUseCase($app->make(CarRepositoryInterface::class));
        });
        $this->app->singleton(DeleteCarUseCase::class, function ($app) {
            return new DeleteCarUseCase($app->make(CarRepositoryInterface::class));
        });

        $this->app->singleton(CreateUserUseCase::class, function ($app) {
            return new CreateUserUseCase($app->make(UserRepositoryInterface::class));
        });
        $this->app->singleton(GetUserUseCase::class, function ($app) {
            return new GetUserUseCase($app->make(UserRepositoryInterface::class));
        });
        $this->app->singleton(ListUsersUseCase::class, function ($app) {
            return new ListUsersUseCase($app->make(UserRepositoryInterface::class));
        });
        $this->app->singleton(UpdateUserUseCase::class, function ($app) {
            return new UpdateUserUseCase($app->make(UserRepositoryInterface::class));
        });
        $this->app->singleton(DeleteUserUseCase::class, function ($app) {
            return new DeleteUserUseCase($app->make(UserRepositoryInterface::class));
        });
    }

    public function boot(): void
    {
        //
    }
}
