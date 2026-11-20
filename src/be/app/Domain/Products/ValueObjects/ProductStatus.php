<?php

declare(strict_types=1);

namespace DDD\Domain\Products\ValueObjects;

use InvalidArgumentException;

final class ProductStatus
{
    public const ACTIVE = 'active';

    public const INACTIVE = 'inactive';

    public const ARCHIVED = 'archived';

    public const array VALUES = [self::ACTIVE, self::INACTIVE, self::ARCHIVED];

    private function __construct(
        public readonly string $value,
    ) {}

    public static function from(string $value): self
    {
        if (! in_array($value, self::VALUES, true)) {
            throw new InvalidArgumentException("Invalid product status: {$value}");
        }

        return new self($value);
    }

    public function isActive(): bool
    {
        return $this->value === self::ACTIVE;
    }

    public function isInactive(): bool
    {
        return $this->value === self::INACTIVE;
    }

    public function isArchived(): bool
    {
        return $this->value === self::ARCHIVED;
    }

    public function __toString(): string
    {
        return $this->value;
    }
}
