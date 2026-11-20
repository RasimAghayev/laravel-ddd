<?php

declare(strict_types=1);

namespace DDD\Domain\Invoices\ValueObjects;

use InvalidArgumentException;

final class InvoiceStatus
{
    public const DRAFT = 'draft';

    public const ISSUED = 'issued';

    public const PAID = 'paid';

    public const OVERDUE = 'overdue';

    public const VOID = 'void';

    public const array VALUES = [self::DRAFT, self::ISSUED, self::PAID, self::OVERDUE, self::VOID];

    private function __construct(
        public readonly string $value,
    ) {}

    public static function from(string $value): self
    {
        if (! in_array($value, self::VALUES, true)) {
            throw new InvalidArgumentException("Invalid invoice status: {$value}");
        }

        return new self($value);
    }

    public function isDraft(): bool
    {
        return $this->value === self::DRAFT;
    }

    public function isIssued(): bool
    {
        return $this->value === self::ISSUED;
    }

    public function isPaid(): bool
    {
        return $this->value === self::PAID;
    }

    public function isOverdue(): bool
    {
        return $this->value === self::OVERDUE;
    }

    public function isVoid(): bool
    {
        return $this->value === self::VOID;
    }

    public function __toString(): string
    {
        return $this->value;
    }
}
