<?php

declare(strict_types=1);

namespace DDD\Domain\Cars\ValueObjects;

use InvalidArgumentException;

final class Price
{
    private function __construct(
        public readonly int $cents,
        public readonly string $currency = 'USD',
    ) {
        if ($cents < 0) {
            throw new InvalidArgumentException('Price cannot be negative');
        }
    }

    public static function fromCents(int $cents, string $currency = 'USD'): self
    {
        return new self($cents, $currency);
    }

    public static function fromDecimal(string $decimal, string $currency = 'USD'): self
    {
        $cents = (int) round((float) $decimal * 100);

        return new self($cents, $currency);
    }

    public function toDecimal(): string
    {
        return number_format($this->cents / 100, 2, '.', '');
    }

    public function __toString(): string
    {
        return $this->toDecimal().' '.$this->currency;
    }
}
