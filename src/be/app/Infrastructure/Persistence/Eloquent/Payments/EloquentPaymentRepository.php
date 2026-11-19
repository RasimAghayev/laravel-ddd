<?php

declare(strict_types=1);

namespace DDD\Infrastructure\Persistence\Eloquent\Payments;

use DDD\Domain\Payments\Payment;
use DDD\Domain\Payments\Repository\PaymentRepositoryInterface;
use DDD\Domain\Payments\ValueObjects\PaymentStatus;
use DDD\Domain\Shared\Criteria\Pagination;

class EloquentPaymentRepository implements PaymentRepositoryInterface
{
    public function findById(string $id): ?Payment
    {
        return Payment::find($id);
    }

    public function findByOrderId(string $orderId): array
    {
        return Payment::where('order_id', $orderId)->get()->all();
    }

    public function findAll(?Pagination $pagination = null): array
    {
        $query = Payment::query();

        if ($pagination !== null) {
            $query->offset($pagination->offset())->limit($pagination->perPage);
        }

        return $query->get()->all();
    }

    public function findByStatus(PaymentStatus $status, ?Pagination $pagination = null): array
    {
        $query = Payment::where('status', $status->value);

        if ($pagination !== null) {
            $query->offset($pagination->offset())->limit($pagination->perPage);
        }

        return $query->get()->all();
    }

    public function save(Payment $payment): void
    {
        $payment->save();
    }

    public function delete(Payment $payment): void
    {
        $payment->delete();
    }

    public function count(): int
    {
        return Payment::count();
    }
}
