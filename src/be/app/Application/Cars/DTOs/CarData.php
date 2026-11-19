<?php

declare(strict_types=1);

namespace DDD\Application\Cars\DTOs;

use DDD\Domain\Cars\ValueObjects\CarStatus;
use DDD\Domain\Cars\ValueObjects\Price;

final class CarData
{
    public function __construct(
        public readonly ?string $id,
        public readonly string $brand,
        public readonly string $model,
        public readonly int $year,
        public readonly Price $price,
        public readonly CarStatus $status,
    ) {
    }

    public static function fromRequest(array $data): self
    {
        return new self(
            id: $data['id'] ?? null,
            brand: $data['brand'],
            model: $data['model'],
            year: (int) $data['year'],
            price: Price::fromDecimal((string) $data['price'], $data['currency'] ?? 'USD'),
            status: CarStatus::from($data['status'] ?? CarStatus::ACTIVE),
        );
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'brand' => $this->brand,
            'model' => $this->model,
            'year' => $this->year,
            'price_cents' => $this->price->cents,
            'currency' => $this->price->currency,
            'status' => (string) $this->status,
        ];
    }
}
