<?php

declare(strict_types=1);

namespace DDD\Application\Orders\DTOs;

use DDD\Domain\Orders\ValueObjects\OrderStatus;

final class OrderData
{
    public function __construct(
        public readonly ?string $id,
        public readonly string $userId,
        public readonly int $totalCents,
        public readonly string $currency,
        public readonly OrderStatus $status,
    ) {}

    public static function fromRequest(array $data): self
    {
        return new self(
            id: $data['id'] ?? null,
            userId: $data['user_id'],
            totalCents: (int) $data['total_cents'],
            currency: $data['currency'] ?? 'USD',
            status: OrderStatus::from($data['status'] ?? OrderStatus::PENDING),
        );
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'user_id' => $this->userId,
            'total_cents' => $this->totalCents,
            'currency' => $this->currency,
            'status' => (string) $this->status,
        ];
    }
}
