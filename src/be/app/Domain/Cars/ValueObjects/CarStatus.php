<?php

declare(strict_types=1);

namespace DDD\Domain\Cars\ValueObjects;

use InvalidArgumentException;

final class CarStatus
{
    public const ACTIVE = 'active';

    public const SOLD = 'sold';

    public const RESERVED = 'reserved';

    public const MAINTENANCE = 'maintenance';

    public const array VALUES = [self::ACTIVE, self::SOLD, self::RESERVED, self::MAINTENANCE];

    private function __construct(
        public readonly string $value,
    ) {}

    public static function from(string $value): self
    {
        if (! in_array($value, self::VALUES, true)) {
            throw new InvalidArgumentException("Invalid car status: {$value}");
        }

        return new self($value);
    }

    public function isActive(): bool
    {
        return $this->value === self::ACTIVE;
    }

    public function isSold(): bool
    {
        return $this->value === self::SOLD;
    }

    public function __toString(): string
    {
        return $this->value;
    }
}
