<?php

declare(strict_types=1);

namespace DDD\Application\Invoices\DTOs;

use DDD\Domain\Invoices\ValueObjects\InvoiceStatus;

final class InvoiceData
{
    public function __construct(
        public readonly ?string $id,
        public readonly string $orderId,
        public readonly int $amountCents,
        public readonly string $currency,
        public readonly InvoiceStatus $status,
        public readonly ?string $dueAt,
    ) {
    }

    public static function fromRequest(array $data): self
    {
        return new self(
            id: $data['id'] ?? null,
            orderId: $data['order_id'],
            amountCents: (int) $data['amount_cents'],
            currency: $data['currency'] ?? 'USD',
            status: InvoiceStatus::from($data['status'] ?? InvoiceStatus::DRAFT),
            dueAt: $data['due_at'] ?? null,
        );
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'order_id' => $this->orderId,
            'amount_cents' => $this->amountCents,
            'currency' => $this->currency,
            'status' => (string) $this->status,
            'due_at' => $this->dueAt,
        ];
    }
}
