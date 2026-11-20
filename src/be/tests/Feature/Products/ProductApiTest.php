<?php

declare(strict_types=1);

namespace Tests\Feature\Products;

use DDD\Domain\Products\Product;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class ProductApiTest extends TestCase
{
    use RefreshDatabase;

    public function test_can_list_products(): void
    {
        Product::factory()->count(3)->create();

        $response = $this->getJson('/api/v1/products');

        $response->assertStatus(200)
            ->assertJsonStructure([
                'data' => [
                    '*' => [
                        'id', 'sku', 'name', 'price', 'status', 'is_active',
                    ],
                ],
                'meta',
            ]);
    }

    public function test_can_create_product(): void
    {
        $response = $this->postJson('/api/v1/products', [
            'name' => 'iPhone 15',
            'sku' => 'IPHONE-15-001',
            'description' => 'Latest iPhone',
            'price_cents' => 999900,
            'currency' => 'USD',
            'status' => 'active',
            'stock_quantity' => 50,
        ]);

        $response->assertStatus(201)
            ->assertJson([
                'data' => [
                    'name' => 'iPhone 15',
                    'sku' => 'IPHONE-15-001',
                    'price_cents' => 999900,
                    'status' => 'active',
                ],
            ]);

        $this->assertDatabaseHas('products', [
            'name' => 'iPhone 15',
            'sku' => 'IPHONE-15-001',
        ]);
    }

    public function test_can_show_product(): void
    {
        $product = Product::factory()->create(['name' => 'Samsung Galaxy']);

        $response = $this->getJson('/api/v1/products/'.$product->id);

        $response->assertStatus(200)
            ->assertJson(['data' => ['name' => 'Samsung Galaxy']]);
    }

    public function test_returns_404_for_missing_product(): void
    {
        $response = $this->getJson('/api/v1/products/999999');

        $response->assertStatus(404);
    }

    public function test_can_update_product(): void
    {
        $product = Product::factory()->create(['stock_quantity' => 10]);

        $response = $this->putJson('/api/v1/products/'.$product->id, [
            'stock_quantity' => 25,
        ]);

        $response->assertStatus(200)
            ->assertJson(['data' => ['stock_quantity' => 25]]);

        $this->assertDatabaseHas('products', [
            'id' => $product->id,
            'stock_quantity' => 25,
        ]);
    }

    public function test_can_delete_product(): void
    {
        $product = Product::factory()->create();

        $response = $this->deleteJson('/api/v1/products/'.$product->id);

        $response->assertStatus(204);

        $this->assertDatabaseMissing('products', ['id' => $product->id]);
    }

    public function test_validation_requires_name_and_sku(): void
    {
        $response = $this->postJson('/api/v1/products', []);

        $response->assertStatus(422)
            ->assertJsonValidationErrors(['name', 'sku']);
    }
}
