<?php

declare(strict_types=1);

namespace DDD\Application\Payments\DTOs;

use DDD\Domain\Payments\ValueObjects\PaymentMethod;
use DDD\Domain\Payments\ValueObjects\PaymentStatus;

final class PaymentData
{
    public function __construct(
        public readonly ?string $id,
        public readonly string $orderId,
        public readonly int $amountCents,
        public readonly string $currency,
        public readonly PaymentMethod $method,
        public readonly PaymentStatus $status,
        public readonly ?string $transactionReference,
    ) {
    }

    public static function fromRequest(array $data): self
    {
        return new self(
            id: $data['id'] ?? null,
            orderId: $data['order_id'],
            amountCents: (int) $data['amount_cents'],
            currency: $data['currency'] ?? 'USD',
            method: PaymentMethod::from($data['method'] ?? PaymentMethod::CREDIT_CARD),
            status: PaymentStatus::from($data['status'] ?? PaymentStatus::PENDING),
            transactionReference: $data['transaction_reference'] ?? null,
        );
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'order_id' => $this->orderId,
            'amount_cents' => $this->amountCents,
            'currency' => $this->currency,
            'method' => (string) $this->method,
            'status' => (string) $this->status,
            'transaction_reference' => $this->transactionReference,
        ];
    }
}
