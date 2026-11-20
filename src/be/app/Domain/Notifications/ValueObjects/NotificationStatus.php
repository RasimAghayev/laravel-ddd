<?php

declare(strict_types=1);

namespace DDD\Domain\Notifications\ValueObjects;

use InvalidArgumentException;

final class NotificationStatus
{
    public const PENDING = 'pending';

    public const SENT = 'sent';

    public const FAILED = 'failed';

    public const READ = 'read';

    public const array VALUES = [self::PENDING, self::SENT, self::FAILED, self::READ];

    private function __construct(
        public readonly string $value,
    ) {}

    public static function from(string $value): self
    {
        if (! in_array($value, self::VALUES, true)) {
            throw new InvalidArgumentException("Invalid notification status: {$value}");
        }

        return new self($value);
    }

    public function isPending(): bool
    {
        return $this->value === self::PENDING;
    }

    public function isSent(): bool
    {
        return $this->value === self::SENT;
    }

    public function isFailed(): bool
    {
        return $this->value === self::FAILED;
    }

    public function isRead(): bool
    {
        return $this->value === self::READ;
    }

    public function __toString(): string
    {
        return $this->value;
    }
}
