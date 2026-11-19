<?php

declare(strict_types=1);

namespace Database\Factories\Domain\Payments;

use DDD\Domain\Orders\Order;
use DDD\Domain\Payments\Payment;
use Illuminate\Database\Eloquent\Factories\Factory;

class PaymentFactory extends Factory
{
    protected $model = Payment::class;

    public function definition(): array
    {
        return [
            'order_id' => Order::factory(),
            'amount_cents' => fake()->numberBetween(1000, 1000000),
            'currency' => fake()->randomElement(['USD', 'EUR', 'AZN']),
            'method' => fake()->randomElement(['credit_card', 'bank_transfer', 'paypal', 'cash']),
            'status' => fake()->randomElement(['pending', 'completed', 'failed', 'refunded', 'cancelled']),
            'transaction_reference' => fake()->uuid(),
        ];
    }
}
