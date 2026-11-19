<?php

declare(strict_types=1);

namespace DDD\Domain\Notifications\ValueObjects;

use InvalidArgumentException;

final class NotificationChannel
{
    public const EMAIL = 'email';
    public const SMS = 'sms';
    public const PUSH = 'push';
    public const WEBHOOK = 'webhook';

    public const array VALUES = [self::EMAIL, self::SMS, self::PUSH, self::WEBHOOK];

    private function __construct(
        public readonly string $value,
    ) {
    }

    public static function from(string $value): self
    {
        if (! in_array($value, self::VALUES, true)) {
            throw new InvalidArgumentException("Invalid notification channel: {$value}");
        }

        return new self($value);
    }

    public function __toString(): string
    {
        return $this->value;
    }
}
