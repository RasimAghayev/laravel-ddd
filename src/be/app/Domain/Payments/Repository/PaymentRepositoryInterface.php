<?php

declare(strict_types=1);

namespace DDD\Domain\Payments\Repository;

use DDD\Domain\Payments\Payment;
use DDD\Domain\Shared\Criteria\Pagination;

interface PaymentRepositoryInterface
{
    public function findById(string $id): ?Payment;

    public function findByOrderId(string $orderId): array;

    public function findAll(?Pagination $pagination = null): array;

    public function findByStatus(PaymentStatus $status, ?Pagination $pagination = null): array;

    public function save(Payment $payment): void;

    public function delete(Payment $payment): void;

    public function count(): int;
}
