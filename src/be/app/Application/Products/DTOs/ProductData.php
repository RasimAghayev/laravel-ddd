<?php

declare(strict_types=1);

namespace DDD\Application\Products\DTOs;

use DDD\Domain\Products\ValueObjects\ProductStatus;

final class ProductData
{
    public function __construct(
        public readonly ?string $id,
        public readonly string $name,
        public readonly string $sku,
        public readonly string $description,
        public readonly int $priceCents,
        public readonly string $currency,
        public readonly ProductStatus $status,
        public readonly int $stockQuantity,
    ) {
    }

    public static function fromRequest(array $data): self
    {
        return new self(
            id: $data['id'] ?? null,
            name: $data['name'],
            sku: $data['sku'],
            description: $data['description'] ?? '',
            priceCents: (int) $data['price_cents'],
            currency: $data['currency'] ?? 'USD',
            status: ProductStatus::from($data['status'] ?? ProductStatus::ACTIVE),
            stockQuantity: (int) ($data['stock_quantity'] ?? 0),
        );
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'sku' => $this->sku,
            'description' => $this->description,
            'price_cents' => $this->priceCents,
            'currency' => $this->currency,
            'status' => (string) $this->status,
            'stock_quantity' => $this->stockQuantity,
        ];
    }
}
