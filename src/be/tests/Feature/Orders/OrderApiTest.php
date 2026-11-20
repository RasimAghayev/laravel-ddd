<?php

declare(strict_types=1);

namespace Tests\Feature\Orders;

use DDD\Domain\Orders\Order;
use DDD\Domain\Users\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class OrderApiTest extends TestCase
{
    use RefreshDatabase;

    public function test_can_list_orders(): void
    {
        Order::factory()->count(3)->create();

        $response = $this->getJson('/api/v1/orders');

        $response->assertStatus(200)
            ->assertJsonStructure([
                'data' => [
                    '*' => [
                        'id', 'order_number', 'user_id', 'total', 'status', 'is_pending',
                    ],
                ],
                'meta',
            ]);
    }

    public function test_can_create_order(): void
    {
        $user = User::factory()->create();

        $response = $this->postJson('/api/v1/orders', [
            'user_id' => $user->id,
            'total_cents' => 2500000,
            'currency' => 'USD',
            'status' => 'pending',
        ]);

        $response->assertStatus(201)
            ->assertJson([
                'data' => [
                    'user_id' => $user->id,
                    'total_cents' => 2500000,
                    'currency' => 'USD',
                    'status' => 'pending',
                ],
            ]);

        $this->assertDatabaseHas('orders', [
            'user_id' => $user->id,
            'total_cents' => 2500000,
        ]);
    }

    public function test_can_show_order(): void
    {
        $order = Order::factory()->create();

        $response = $this->getJson('/api/v1/orders/'.$order->id);

        $response->assertStatus(200)
            ->assertJson(['data' => ['id' => (string) $order->id]]);
    }

    public function test_returns_404_for_missing_order(): void
    {
        $response = $this->getJson('/api/v1/orders/999999');

        $response->assertStatus(404);
    }

    public function test_can_update_order(): void
    {
        $order = Order::factory()->create(['status' => 'pending']);

        $response = $this->putJson('/api/v1/orders/'.$order->id, [
            'status' => 'confirmed',
        ]);

        $response->assertStatus(200)
            ->assertJson(['data' => ['status' => 'confirmed']]);

        $this->assertDatabaseHas('orders', [
            'id' => $order->id,
            'status' => 'confirmed',
        ]);
    }

    public function test_can_delete_order(): void
    {
        $order = Order::factory()->create();

        $response = $this->deleteJson('/api/v1/orders/'.$order->id);

        $response->assertStatus(204);

        $this->assertDatabaseMissing('orders', ['id' => $order->id]);
    }

    public function test_validation_requires_user_id_and_total_cents(): void
    {
        $response = $this->postJson('/api/v1/orders', []);

        $response->assertStatus(422)
            ->assertJsonValidationErrors(['user_id', 'total_cents']);
    }
}
