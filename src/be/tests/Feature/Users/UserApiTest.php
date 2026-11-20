<?php

declare(strict_types=1);

namespace Tests\Feature\Users;

use DDD\Domain\Users\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class UserApiTest extends TestCase
{
    use RefreshDatabase;

    public function test_can_list_users(): void
    {
        User::factory()->count(3)->create();

        $response = $this->getJson('/api/v1/users');

        $response->assertStatus(200)
            ->assertJsonStructure([
                'data' => [
                    '*' => [
                        'id', 'name', 'email', 'role', 'is_admin',
                    ],
                ],
                'meta',
            ]);
    }

    public function test_can_create_user(): void
    {
        $response = $this->postJson('/api/v1/users', [
            'name' => 'John Doe',
            'email' => 'john@example.com',
            'password' => 'password123',
            'password_confirmation' => 'password123',
            'role' => 'user',
        ]);

        $response->assertStatus(201)
            ->assertJson([
                'data' => [
                    'name' => 'John Doe',
                    'email' => 'john@example.com',
                    'role' => 'user',
                ],
            ]);

        $this->assertDatabaseHas('users', [
            'email' => 'john@example.com',
        ]);
    }

    public function test_can_show_user(): void
    {
        $user = User::factory()->create(['name' => 'Jane', 'email' => 'jane@example.com']);

        $response = $this->getJson('/api/v1/users/'.$user->id);

        $response->assertStatus(200)
            ->assertJson(['data' => ['name' => 'Jane', 'email' => 'jane@example.com']]);
    }

    public function test_returns_404_for_missing_user(): void
    {
        $response = $this->getJson('/api/v1/users/999999');

        $response->assertStatus(404);
    }

    public function test_can_update_user(): void
    {
        $user = User::factory()->create(['role' => 'user']);

        $response = $this->putJson('/api/v1/users/'.$user->id, [
            'role' => 'moderator',
        ]);

        $response->assertStatus(200)
            ->assertJson(['data' => ['role' => 'moderator']]);
    }

    public function test_can_delete_user(): void
    {
        $user = User::factory()->create();

        $response = $this->deleteJson('/api/v1/users/'.$user->id);

        $response->assertStatus(204);

        $this->assertDatabaseMissing('users', ['id' => $user->id]);
    }

    public function test_validation_requires_name_email_password(): void
    {
        $response = $this->postJson('/api/v1/users', []);

        $response->assertStatus(422)
            ->assertJsonValidationErrors(['name', 'email', 'password']);
    }

    public function test_email_must_be_unique(): void
    {
        User::factory()->create(['email' => 'existing@example.com']);

        $response = $this->postJson('/api/v1/users', [
            'name' => 'Duplicate',
            'email' => 'existing@example.com',
            'password' => 'password123',
            'password_confirmation' => 'password123',
        ]);

        $response->assertStatus(422)
            ->assertJsonValidationErrors(['email']);
    }
}
