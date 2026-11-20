<?php

declare(strict_types=1);

namespace Tests\Feature\Payments;

use DDD\Domain\Orders\Order;
use DDD\Domain\Payments\Payment;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class PaymentApiTest extends TestCase
{
    use RefreshDatabase;

    public function test_can_list_payments(): void
    {
        Payment::factory()->count(3)->create();

        $response = $this->getJson('/api/v1/payments');

        $response->assertStatus(200)
            ->assertJsonStructure([
                'data' => [
                    '*' => [
                        'id', 'order_id', 'amount', 'method', 'status', 'is_paid',
                    ],
                ],
                'meta',
            ]);
    }

    public function test_can_create_payment(): void
    {
        $order = Order::factory()->create();

        $response = $this->postJson('/api/v1/payments', [
            'order_id' => $order->id,
            'amount_cents' => 2500000,
            'currency' => 'USD',
            'method' => 'credit_card',
            'status' => 'pending',
        ]);

        $response->assertStatus(201)
            ->assertJson([
                'data' => [
                    'order_id' => $order->id,
                    'amount_cents' => 2500000,
                    'currency' => 'USD',
                    'method' => 'credit_card',
                    'status' => 'pending',
                ],
            ]);

        $this->assertDatabaseHas('payments', [
            'order_id' => $order->id,
            'amount_cents' => 2500000,
        ]);
    }

    public function test_can_show_payment(): void
    {
        $payment = Payment::factory()->create();

        $response = $this->getJson('/api/v1/payments/'.$payment->id);

        $response->assertStatus(200)
            ->assertJson(['data' => ['id' => (string) $payment->id]]);
    }

    public function test_returns_404_for_missing_payment(): void
    {
        $response = $this->getJson('/api/v1/payments/999999');

        $response->assertStatus(404);
    }

    public function test_can_update_payment(): void
    {
        $payment = Payment::factory()->create(['status' => 'pending']);

        $response = $this->putJson('/api/v1/payments/'.$payment->id, [
            'status' => 'completed',
        ]);

        $response->assertStatus(200)
            ->assertJson(['data' => ['status' => 'completed']]);

        $this->assertDatabaseHas('payments', [
            'id' => $payment->id,
            'status' => 'completed',
        ]);
    }

    public function test_can_delete_payment(): void
    {
        $payment = Payment::factory()->create();

        $response = $this->deleteJson('/api/v1/payments/'.$payment->id);

        $response->assertStatus(204);

        $this->assertDatabaseMissing('payments', ['id' => $payment->id]);
    }

    public function test_validation_requires_order_id_and_amount_cents(): void
    {
        $response = $this->postJson('/api/v1/payments', []);

        $response->assertStatus(422)
            ->assertJsonValidationErrors(['order_id', 'amount_cents']);
    }
}
