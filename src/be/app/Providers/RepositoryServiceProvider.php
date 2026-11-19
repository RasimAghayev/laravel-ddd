<?php

declare(strict_types=1);

namespace DDD\Providers;

use DDD\Application\AuditLog\UseCases\CreateAuditLogUseCase;
use DDD\Application\AuditLog\UseCases\ListAuditLogsUseCase;
use DDD\Application\Cars\UseCases\CreateCarUseCase;
use DDD\Application\Cars\UseCases\DeleteCarUseCase;
use DDD\Application\Cars\UseCases\GetCarUseCase;
use DDD\Application\Cars\UseCases\ListCarsUseCase;
use DDD\Application\Cars\UseCases\UpdateCarUseCase;
use DDD\Application\Orders\UseCases\CreateOrderUseCase;
use DDD\Application\Orders\UseCases\DeleteOrderUseCase;
use DDD\Application\Orders\UseCases\GetOrderUseCase;
use DDD\Application\Orders\UseCases\ListOrdersUseCase;
use DDD\Application\Orders\UseCases\UpdateOrderUseCase;
use DDD\Application\Products\UseCases\CreateProductUseCase;
use DDD\Application\Products\UseCases\DeleteProductUseCase;
use DDD\Application\Products\UseCases\GetProductUseCase;
use DDD\Application\Products\UseCases\ListProductsUseCase;
use DDD\Application\Products\UseCases\UpdateProductUseCase;
use DDD\Application\Users\UseCases\CreateUserUseCase;
use DDD\Application\Users\UseCases\DeleteUserUseCase;
use DDD\Application\Users\UseCases\GetUserUseCase;
use DDD\Application\Users\UseCases\ListUsersUseCase;
use DDD\Application\Users\UseCases\UpdateUserUseCase;
use DDD\Domain\AuditLog\Repository\AuditLogRepositoryInterface;
use DDD\Domain\Cars\Repository\CarRepositoryInterface;
use DDD\Domain\Orders\Repository\OrderRepositoryInterface;
use DDD\Domain\Products\Repository\ProductRepositoryInterface;
use DDD\Domain\Users\Repository\UserRepositoryInterface;
use DDD\Infrastructure\Persistence\Eloquent\AuditLog\EloquentAuditLogRepository;
use DDD\Infrastructure\Persistence\Eloquent\Cars\EloquentCarRepository;
use DDD\Infrastructure\Persistence\Eloquent\Orders\EloquentOrderRepository;
use DDD\Infrastructure\Persistence\Eloquent\Products\EloquentProductRepository;
use DDD\Infrastructure\Persistence\Eloquent\Users\EloquentUserRepository;
use Illuminate\Support\ServiceProvider;

class RepositoryServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        $this->app->bind(CarRepositoryInterface::class, EloquentCarRepository::class);
        $this->app->bind(UserRepositoryInterface::class, EloquentUserRepository::class);
        $this->app->bind(OrderRepositoryInterface::class, EloquentOrderRepository::class);
        $this->app->bind(ProductRepositoryInterface::class, EloquentProductRepository::class);
        $this->app->bind(AuditLogRepositoryInterface::class, EloquentAuditLogRepository::class);

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

        $this->app->singleton(CreateOrderUseCase::class, function ($app) {
            return new CreateOrderUseCase($app->make(OrderRepositoryInterface::class));
        });
        $this->app->singleton(GetOrderUseCase::class, function ($app) {
            return new GetOrderUseCase($app->make(OrderRepositoryInterface::class));
        });
        $this->app->singleton(ListOrdersUseCase::class, function ($app) {
            return new ListOrdersUseCase($app->make(OrderRepositoryInterface::class));
        });
        $this->app->singleton(UpdateOrderUseCase::class, function ($app) {
            return new UpdateOrderUseCase($app->make(OrderRepositoryInterface::class));
        });
        $this->app->singleton(DeleteOrderUseCase::class, function ($app) {
            return new DeleteOrderUseCase($app->make(OrderRepositoryInterface::class));
        });

        $this->app->singleton(CreateProductUseCase::class, function ($app) {
            return new CreateProductUseCase($app->make(ProductRepositoryInterface::class));
        });
        $this->app->singleton(GetProductUseCase::class, function ($app) {
            return new GetProductUseCase($app->make(ProductRepositoryInterface::class));
        });
        $this->app->singleton(ListProductsUseCase::class, function ($app) {
            return new ListProductsUseCase($app->make(ProductRepositoryInterface::class));
        });
        $this->app->singleton(UpdateProductUseCase::class, function ($app) {
            return new UpdateProductUseCase($app->make(ProductRepositoryInterface::class));
        });
        $this->app->singleton(DeleteProductUseCase::class, function ($app) {
            return new DeleteProductUseCase($app->make(ProductRepositoryInterface::class));
        });

        $this->app->singleton(CreateAuditLogUseCase::class, function ($app) {
            return new CreateAuditLogUseCase($app->make(AuditLogRepositoryInterface::class));
        });
        $this->app->singleton(ListAuditLogsUseCase::class, function ($app) {
            return new ListAuditLogsUseCase($app->make(AuditLogRepositoryInterface::class));
        });
    }

    public function boot(): void
    {
        //
    }
}
