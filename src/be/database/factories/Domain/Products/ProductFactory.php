<?php

declare(strict_types=1);

namespace Database\Factories\Domain\Products;

use DDD\Domain\Products\Product;
use Illuminate\Database\Eloquent\Factories\Factory;

class ProductFactory extends Factory
{
    protected $model = Product::class;

    public function definition(): array
    {
        return [
            'name' => fake()->word(),
            'sku' => fake()->unique()->uuid(),
            'description' => fake()->sentence(),
            'price_cents' => fake()->numberBetween(1000, 1000000),
            'currency' => fake()->randomElement(['USD', 'EUR', 'AZN']),
            'status' => fake()->randomElement(['active', 'inactive', 'archived']),
            'stock_quantity' => fake()->numberBetween(0, 1000),
        ];
    }
}
