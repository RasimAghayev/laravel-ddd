<?php

declare(strict_types=1);

namespace Tests\Unit\Domain\Cars;

use DDD\Domain\Cars\Car;
use DDD\Domain\Cars\ValueObjects\CarStatus;
use DDD\Domain\Cars\ValueObjects\Price;
use PHPUnit\Framework\TestCase;

class CarTest extends TestCase
{
    public function test_car_has_default_active_status(): void
    {
        $car = new Car;
        $car->brand = 'Toyota';
        $car->model = 'Camry';
        $car->year = 2023;
        $car->price_cents = 2500000;
        $car->currency = 'USD';
        $car->status = CarStatus::from(CarStatus::ACTIVE);

        $this->assertTrue($car->isActive());
        $this->assertSame(CarStatus::ACTIVE, (string) $car->status);
    }

    public function test_car_can_be_sold(): void
    {
        $car = new Car;
        $car->status = CarStatus::from(CarStatus::ACTIVE);
        $car->sell();

        $this->assertTrue($car->status->isSold());
        $this->assertFalse($car->isActive());
    }

    public function test_car_can_be_reserved(): void
    {
        $car = new Car;
        $car->status = CarStatus::from(CarStatus::ACTIVE);
        $car->reserve();

        $this->assertSame(CarStatus::RESERVED, (string) $car->status);
    }

    public function test_price_value_object(): void
    {
        $price = Price::fromDecimal('25000.00', 'USD');

        $this->assertSame(2500000, $price->cents);
        $this->assertSame('USD', $price->currency);
        $this->assertSame('25000.00 USD', (string) $price);
    }

    public function test_car_status_rejects_invalid_value(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        CarStatus::from('invalid_status');
    }
}
