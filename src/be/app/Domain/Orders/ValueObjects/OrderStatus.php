<?php

declare(strict_types=1);

namespace DDD\Domain\Orders\ValueObjects;

use InvalidArgumentException;

final class OrderStatus
{
    public const PENDING = 'pending';
    public const CONFIRMED = 'confirmed';
    public const SHIPPED = 'shipped';
    public const DELIVERED = 'delivered';
    public const CANCELLED = 'cancelled';

    public const array VALUES = [self::PENDING, self::CONFIRMED, self::SHIPPED, self::DELIVERED, self::CANCELLED];

    private function __construct(
        public readonly string $value,
    ) {
    }

    public static function from(string $value): self
    {
        if (! in_array($value, self::VALUES, true)) {
            throw new InvalidArgumentException("Invalid order status: {$value}");
        }

        return new self($value);
    }

    public function isPending(): bool
    {
        return $this->value === self::PENDING;
    }

    public function isConfirmed(): bool
    {
        return $this->value === self::CONFIRMED;
    }

    public function isShipped(): bool
    {
        return $this->value === self::SHIPPED;
    }

    public function isDelivered(): bool
    {
        return $this->value === self::DELIVERED;
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
