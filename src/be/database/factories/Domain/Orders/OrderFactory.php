<?php

declare(strict_types=1);

namespace Database\Factories\Domain\Orders;

use DDD\Domain\Orders\Order;
use DDD\Domain\Users\User;
use Illuminate\Database\Eloquent\Factories\Factory;

class OrderFactory extends Factory
{
    protected $model = Order::class;

    public function definition(): array
    {
        return [
            'user_id' => User::factory(),
            'total_cents' => fake()->numberBetween(1000, 1000000),
            'currency' => fake()->randomElement(['USD', 'EUR', 'AZN']),
            'status' => fake()->randomElement(['pending', 'confirmed', 'shipped', 'delivered', 'cancelled']),
        ];
    }
}
