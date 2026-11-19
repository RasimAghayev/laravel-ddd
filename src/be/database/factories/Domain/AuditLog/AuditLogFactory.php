<?php

declare(strict_types=1);

namespace Database\Factories\Domain\AuditLog;

use DDD\Domain\AuditLog\AuditLog;
use Illuminate\Database\Eloquent\Factories\Factory;

class AuditLogFactory extends Factory
{
    protected $model = AuditLog::class;

    public function definition(): array
    {
        return [
            'actor_type' => fake()->randomElement(['user', 'system', 'admin']),
            'actor_id' => fake()->uuid(),
            'action' => fake()->randomElement(['create', 'update', 'delete', 'view']),
            'subject_type' => fake()->randomElement(['Order', 'Product', 'Car', 'User']),
            'subject_id' => fake()->uuid(),
            'changes' => [
                'before' => fake()->word(),
                'after' => fake()->word(),
            ],
        ];
    }
}
