<?php

declare(strict_types=1);

namespace DDD\Domain\Users\ValueObjects;

use InvalidArgumentException;

final class UserRole
{
    public const ADMIN = 'admin';

    public const USER = 'user';

    public const MODERATOR = 'moderator';

    public const array VALUES = [self::ADMIN, self::USER, self::MODERATOR];

    private function __construct(
        public readonly string $value,
    ) {}

    public static function from(string $value): self
    {
        if (! in_array($value, self::VALUES, true)) {
            throw new InvalidArgumentException("Invalid user role: {$value}");
        }

        return new self($value);
    }

    public function isAdmin(): bool
    {
        return $this->value === self::ADMIN;
    }

    public function __toString(): string
    {
        return $this->value;
    }
}
