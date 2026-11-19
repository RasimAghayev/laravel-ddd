<?php

declare(strict_types=1);

namespace DDD\Domain\Orders\Repository;

use DDD\Domain\Orders\Order;
use DDD\Domain\Shared\Criteria\Pagination;

interface OrderRepositoryInterface
{
    public function findById(string $id): ?Order;

    public function findByUserId(string $userId, ?Pagination $pagination = null): array;

    public function findAll(?Pagination $pagination = null): array;

    public function save(Order $order): void;

    public function delete(Order $order): void;

    public function count(): int;
}
