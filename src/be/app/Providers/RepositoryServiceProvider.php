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
use DDD\Application\Invoices\UseCases\CreateInvoiceUseCase;
use DDD\Application\Invoices\UseCases\DeleteInvoiceUseCase;
use DDD\Application\Invoices\UseCases\GetInvoiceUseCase;
use DDD\Application\Invoices\UseCases\ListInvoicesUseCase;
use DDD\Application\Invoices\UseCases\UpdateInvoiceUseCase;
use DDD\Application\Notifications\UseCases\CreateNotificationUseCase;
use DDD\Application\Notifications\UseCases\DeleteNotificationUseCase;
use DDD\Application\Notifications\UseCases\GetNotificationUseCase;
use DDD\Application\Notifications\UseCases\ListNotificationsUseCase;
use DDD\Application\Notifications\UseCases\UpdateNotificationUseCase;
use DDD\Application\Orders\UseCases\CreateOrderUseCase;
use DDD\Application\Orders\UseCases\DeleteOrderUseCase;
use DDD\Application\Orders\UseCases\GetOrderUseCase;
use DDD\Application\Orders\UseCases\ListOrdersUseCase;
use DDD\Application\Orders\UseCases\UpdateOrderUseCase;
use DDD\Application\Payments\UseCases\CreatePaymentUseCase;
use DDD\Application\Payments\UseCases\DeletePaymentUseCase;
use DDD\Application\Payments\UseCases\GetPaymentUseCase;
use DDD\Application\Payments\UseCases\ListPaymentsUseCase;
use DDD\Application\Payments\UseCases\UpdatePaymentUseCase;
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
use DDD\Domain\Invoices\Repository\InvoiceRepositoryInterface;
use DDD\Domain\Notifications\Repository\NotificationRepositoryInterface;
use DDD\Domain\Orders\Repository\OrderRepositoryInterface;
use DDD\Domain\Payments\Repository\PaymentRepositoryInterface;
use DDD\Domain\Products\Repository\ProductRepositoryInterface;
use DDD\Domain\Users\Repository\UserRepositoryInterface;
use DDD\Infrastructure\Persistence\Eloquent\AuditLog\EloquentAuditLogRepository;
use DDD\Infrastructure\Persistence\Eloquent\Cars\EloquentCarRepository;
use DDD\Infrastructure\Persistence\Eloquent\Invoices\EloquentInvoiceRepository;
use DDD\Infrastructure\Persistence\Eloquent\Notifications\EloquentNotificationRepository;
use DDD\Infrastructure\Persistence\Eloquent\Orders\EloquentOrderRepository;
use DDD\Infrastructure\Persistence\Eloquent\Payments\EloquentPaymentRepository;
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
        $this->app->bind(InvoiceRepositoryInterface::class, EloquentInvoiceRepository::class);
        $this->app->bind(PaymentRepositoryInterface::class, EloquentPaymentRepository::class);
        $this->app->bind(NotificationRepositoryInterface::class, EloquentNotificationRepository::class);

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

        $this->app->singleton(CreateInvoiceUseCase::class, function ($app) {
            return new CreateInvoiceUseCase($app->make(InvoiceRepositoryInterface::class));
        });
        $this->app->singleton(GetInvoiceUseCase::class, function ($app) {
            return new GetInvoiceUseCase($app->make(InvoiceRepositoryInterface::class));
        });
        $this->app->singleton(ListInvoicesUseCase::class, function ($app) {
            return new ListInvoicesUseCase($app->make(InvoiceRepositoryInterface::class));
        });
        $this->app->singleton(UpdateInvoiceUseCase::class, function ($app) {
            return new UpdateInvoiceUseCase($app->make(InvoiceRepositoryInterface::class));
        });
        $this->app->singleton(DeleteInvoiceUseCase::class, function ($app) {
            return new DeleteInvoiceUseCase($app->make(InvoiceRepositoryInterface::class));
        });

        $this->app->singleton(CreatePaymentUseCase::class, function ($app) {
            return new CreatePaymentUseCase($app->make(PaymentRepositoryInterface::class));
        });
        $this->app->singleton(GetPaymentUseCase::class, function ($app) {
            return new GetPaymentUseCase($app->make(PaymentRepositoryInterface::class));
        });
        $this->app->singleton(ListPaymentsUseCase::class, function ($app) {
            return new ListPaymentsUseCase($app->make(PaymentRepositoryInterface::class));
        });
        $this->app->singleton(UpdatePaymentUseCase::class, function ($app) {
            return new UpdatePaymentUseCase($app->make(PaymentRepositoryInterface::class));
        });
        $this->app->singleton(DeletePaymentUseCase::class, function ($app) {
            return new DeletePaymentUseCase($app->make(PaymentRepositoryInterface::class));
        });

        $this->app->singleton(CreateNotificationUseCase::class, function ($app) {
            return new CreateNotificationUseCase($app->make(NotificationRepositoryInterface::class));
        });
        $this->app->singleton(GetNotificationUseCase::class, function ($app) {
            return new GetNotificationUseCase($app->make(NotificationRepositoryInterface::class));
        });
        $this->app->singleton(ListNotificationsUseCase::class, function ($app) {
            return new ListNotificationsUseCase($app->make(NotificationRepositoryInterface::class));
        });
        $this->app->singleton(UpdateNotificationUseCase::class, function ($app) {
            return new UpdateNotificationUseCase($app->make(NotificationRepositoryInterface::class));
        });
        $this->app->singleton(DeleteNotificationUseCase::class, function ($app) {
            return new DeleteNotificationUseCase($app->make(NotificationRepositoryInterface::class));
        });
    }

    public function boot(): void
    {
        //
    }
}
