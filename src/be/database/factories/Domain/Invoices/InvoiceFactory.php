<?php

declare(strict_types=1);

namespace Database\Factories\Domain\Invoices;

use DDD\Domain\Invoices\Invoice;
use DDD\Domain\Orders\Order;
use Illuminate\Database\Eloquent\Factories\Factory;

class InvoiceFactory extends Factory
{
    protected $model = Invoice::class;

    public function definition(): array
    {
        return [
            'order_id' => Order::factory(),
            'amount_cents' => fake()->numberBetween(1000, 1000000),
            'currency' => fake()->randomElement(['USD', 'EUR', 'AZN']),
            'status' => fake()->randomElement(['draft', 'issued', 'paid', 'overdue', 'void']),
            'due_at' => fake()->dateTimeBetween('+1 day', '+30 days'),
        ];
    }
}
