<?php

declare(strict_types=1);

namespace DDD\Domain\Payments\ValueObjects;

use InvalidArgumentException;

final class PaymentStatus
{
    public const PENDING = 'pending';
    public const COMPLETED = 'completed';
    public const FAILED = 'failed';
    public const REFUNDED = 'refunded';
    public const CANCELLED = 'cancelled';

    public const array VALUES = [self::PENDING, self::COMPLETED, self::FAILED, self::REFUNDED, self::CANCELLED];

    private function __construct(
        public readonly string $value,
    ) {
    }

    public static function from(string $value): self
    {
        if (! in_array($value, self::VALUES, true)) {
            throw new InvalidArgumentException("Invalid payment status: {$value}");
        }

        return new self($value);
    }

    public function isPending(): bool
    {
        return $this->value === self::PENDING;
    }

    public function isPaid(): bool
    {
        return $this->value === self::COMPLETED;
    }

    public function isFailed(): bool
    {
        return $this->value === self::FAILED;
    }

    public function isRefunded(): bool
    {
        return $this->value === self::REFUNDED;
    }

    public function isCancelled(): bool
    {
        return $this->value === self::CANCELLED;
    }

    public function __toString(): string
    {
        return $this->value;
    }
}
