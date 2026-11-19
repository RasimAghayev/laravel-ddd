<?php

declare(strict_types=1);

namespace DDD\Domain\Users\ValueObjects;

use InvalidArgumentException;

final class Email
{
    private function __construct(
        public readonly string $value,
    ) {
        if (! filter_var($value, FILTER_VALIDATE_EMAIL)) {
            throw new InvalidArgumentException("Invalid email address: {$value}");
        }
    }

    public static function from(string $value): self
    {
        return new self(strtolower(trim($value)));
    }

    public function __toString(): string
    {
        return $this->value;
    }
}
