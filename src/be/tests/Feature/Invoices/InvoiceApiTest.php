<?php

declare(strict_types=1);

namespace Tests\Feature\Invoices;

use DDD\Domain\Invoices\Invoice;
use DDD\Domain\Orders\Order;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class InvoiceApiTest extends TestCase
{
    use RefreshDatabase;
    public function test_can_list_invoices(): void
    {
        Invoice::factory()->count(3)->create();

        $response = $this->getJson('/api/v1/invoices');

        $response->assertStatus(200)
            ->assertJsonStructure([
                'data' => [
                    '*' => [
                        'id', 'invoice_number', 'order_id', 'amount', 'status', 'is_paid',
                    ],
                ],
                'meta',
            ]);
    }

    public function test_can_create_invoice(): void
    {
        $order = Order::factory()->create();

        $response = $this->postJson('/api/v1/invoices', [
            'order_id' => $order->id,
            'amount_cents' => 2500000,
            'currency' => 'USD',
            'status' => 'draft',
        ]);

        $response->assertStatus(201)
            ->assertJson([
                'data' => [
                    'order_id' => $order->id,
                    'amount_cents' => 2500000,
                    'currency' => 'USD',
                    'status' => 'draft',
                ],
            ]);

        $this->assertDatabaseHas('invoices', [
            'order_id' => $order->id,
            'amount_cents' => 2500000,
        ]);
    }

    public function test_can_show_invoice(): void
    {
        $invoice = Invoice::factory()->create();

        $response = $this->getJson('/api/v1/invoices/' . $invoice->id);

        $response->assertStatus(200)
            ->assertJson(['data' => ['id' => (string) $invoice->id]]);
    }

    public function test_returns_404_for_missing_invoice(): void
    {
        $response = $this->getJson('/api/v1/invoices/999999');

        $response->assertStatus(404);
    }

    public function test_can_update_invoice(): void
    {
        $invoice = Invoice::factory()->create(['status' => 'draft']);

        $response = $this->putJson('/api/v1/invoices/' . $invoice->id, [
            'status' => 'issued',
        ]);

        $response->assertStatus(200)
            ->assertJson(['data' => ['status' => 'issued']]);

        $this->assertDatabaseHas('invoices', [
            'id' => $invoice->id,
            'status' => 'issued',
        ]);
    }

    public function test_can_delete_invoice(): void
    {
        $invoice = Invoice::factory()->create();

        $response = $this->deleteJson('/api/v1/invoices/' . $invoice->id);

        $response->assertStatus(204);

        $this->assertDatabaseMissing('invoices', ['id' => $invoice->id]);
    }

    public function test_validation_requires_order_id_and_amount_cents(): void
    {
        $response = $this->postJson('/api/v1/invoices', []);

        $response->assertStatus(422)
            ->assertJsonValidationErrors(['order_id', 'amount_cents']);
    }
}
