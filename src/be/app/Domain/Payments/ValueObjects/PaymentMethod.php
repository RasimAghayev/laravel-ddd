<?php

declare(strict_types=1);

namespace DDD\Domain\Payments\ValueObjects;

use InvalidArgumentException;

final class PaymentMethod
{
    public const CREDIT_CARD = 'credit_card';

    public const BANK_TRANSFER = 'bank_transfer';

    public const PAYPAL = 'paypal';

    public const CASH = 'cash';

    public const array VALUES = [self::CREDIT_CARD, self::BANK_TRANSFER, self::PAYPAL, self::CASH];

    private function __construct(
        public readonly string $value,
    ) {}

    public static function from(string $value): self
    {
        if (! in_array($value, self::VALUES, true)) {
            throw new InvalidArgumentException("Invalid payment method: {$value}");
        }

        return new self($value);
    }

    public function __toString(): string
    {
        return $this->value;
    }
}
