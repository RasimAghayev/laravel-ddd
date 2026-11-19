<?php

declare(strict_types=1);

namespace DDD\Infrastructure\Persistence\Eloquent\Orders;

use DDD\Domain\Orders\Order;
use DDD\Domain\Orders\Repository\OrderRepositoryInterface;
use DDD\Domain\Shared\Criteria\Pagination;

class EloquentOrderRepository implements OrderRepositoryInterface
{
    public function findById(string $id): ?Order
    {
        return Order::find($id);
    }

    public function findByUserId(string $userId, ?Pagination $pagination = null): array
    {
        $query = Order::where('user_id', $userId);

        if ($pagination !== null) {
            $query->offset($pagination->offset())->limit($pagination->perPage);
        }

        return $query->get()->all();
    }

    public function findAll(?Pagination $pagination = null): array
    {
        $query = Order::query();

        if ($pagination !== null) {
            $query->offset($pagination->offset())->limit($pagination->perPage);
        }

        return $query->get()->all();
    }

    public function save(Order $order): void
    {
        $order->save();
    }

    public function delete(Order $order): void
    {
        $order->delete();
    }

    public function count(): int
    {
        return Order::count();
    }
}
