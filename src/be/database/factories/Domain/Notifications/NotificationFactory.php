<?php

declare(strict_types=1);

namespace Database\Factories\Domain\Notifications;

use DDD\Domain\Notifications\Notification;
use Illuminate\Database\Eloquent\Factories\Factory;

class NotificationFactory extends Factory
{
    protected $model = Notification::class;

    public function definition(): array
    {
        return [
            'recipient_type' => fake()->randomElement(['user', 'admin', 'system']),
            'recipient_id' => fake()->uuid(),
            'channel' => fake()->randomElement(['email', 'sms', 'push', 'webhook']),
            'subject' => fake()->sentence(),
            'content' => fake()->paragraph(),
            'status' => fake()->randomElement(['pending', 'sent', 'failed', 'read']),
        ];
    }
}
