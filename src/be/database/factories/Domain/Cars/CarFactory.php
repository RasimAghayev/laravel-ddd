<?php

declare(strict_types=1);

namespace Database\Factories\Domain\Cars;

use DDD\Domain\Cars\Car;
use Illuminate\Database\Eloquent\Factories\Factory;

class CarFactory extends Factory
{
    protected $model = Car::class;

    public function definition(): array
    {
        return [
            'brand' => fake()->company(),
            'model' => fake()->word(),
            'year' => fake()->numberBetween(1990, date('Y')),
            'price_cents' => fake()->numberBetween(1000000, 50000000),
            'currency' => fake()->randomElement(['USD', 'EUR', 'AZN']),
            'status' => fake()->randomElement(['active', 'sold', 'reserved', 'maintenance']),
        ];
    }
}
