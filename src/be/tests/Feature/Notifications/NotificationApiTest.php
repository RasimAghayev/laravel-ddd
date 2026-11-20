<?php

declare(strict_types=1);

namespace Tests\Feature\Notifications;

use DDD\Domain\Notifications\Notification;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class NotificationApiTest extends TestCase
{
    use RefreshDatabase;

    public function test_can_list_notifications(): void
    {
        Notification::factory()->count(3)->create();

        $response = $this->getJson('/api/v1/notifications');

        $response->assertStatus(200)
            ->assertJsonStructure([
                'data' => [
                    '*' => [
                        'id', 'recipient_type', 'channel', 'subject', 'status',
                    ],
                ],
                'meta',
            ]);
    }

    public function test_can_create_notification(): void
    {
        $response = $this->postJson('/api/v1/notifications', [
            'recipient_type' => 'user',
            'recipient_id' => 'user-123',
            'channel' => 'email',
            'subject' => 'Welcome',
            'content' => 'Welcome to our platform!',
            'status' => 'pending',
        ]);

        $response->assertStatus(201)
            ->assertJson([
                'data' => [
                    'recipient_type' => 'user',
                    'recipient_id' => 'user-123',
                    'channel' => 'email',
                    'subject' => 'Welcome',
                ],
            ]);

        $this->assertDatabaseHas('notifications', [
            'recipient_type' => 'user',
            'recipient_id' => 'user-123',
        ]);
    }

    public function test_can_show_notification(): void
    {
        $notification = Notification::factory()->create();

        $response = $this->getJson('/api/v1/notifications/'.$notification->id);

        $response->assertStatus(200)
            ->assertJson(['data' => ['id' => (string) $notification->id]]);
    }

    public function test_returns_404_for_missing_notification(): void
    {
        $response = $this->getJson('/api/v1/notifications/999999');

        $response->assertStatus(404);
    }

    public function test_can_update_notification(): void
    {
        $notification = Notification::factory()->create(['status' => 'pending']);

        $response = $this->putJson('/api/v1/notifications/'.$notification->id, [
            'status' => 'sent',
        ]);

        $response->assertStatus(200)
            ->assertJson(['data' => ['status' => 'sent']]);

        $this->assertDatabaseHas('notifications', [
            'id' => $notification->id,
            'status' => 'sent',
        ]);
    }

    public function test_can_delete_notification(): void
    {
        $notification = Notification::factory()->create();

        $response = $this->deleteJson('/api/v1/notifications/'.$notification->id);

        $response->assertStatus(204);

        $this->assertDatabaseMissing('notifications', ['id' => $notification->id]);
    }

    public function test_validation_requires_recipient_and_subject(): void
    {
        $response = $this->postJson('/api/v1/notifications', []);

        $response->assertStatus(422)
            ->assertJsonValidationErrors(['recipient_type', 'recipient_id', 'subject', 'content']);
    }
}
