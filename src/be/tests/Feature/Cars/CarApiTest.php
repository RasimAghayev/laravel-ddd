<?php

declare(strict_types=1);

namespace Tests\Feature\Cars;

use DDD\Domain\Cars\Car;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class CarApiTest extends TestCase
{
    use RefreshDatabase;
    public function test_can_list_cars(): void
    {
        Car::factory()->count(3)->create();

        $response = $this->getJson('/api/v1/cars');

        $response->assertStatus(200)
            ->assertJsonStructure([
                'data' => [
                    '*' => [
                        'id', 'brand', 'model', 'year', 'price', 'status', 'is_active',
                    ],
                ],
                'meta',
            ]);
    }

    public function test_can_create_car(): void
    {
        $response = $this->postJson('/api/v1/cars', [
            'brand' => 'Toyota',
            'model' => 'Camry',
            'year' => 2023,
            'price' => '25000.00',
            'currency' => 'USD',
            'status' => 'active',
        ]);

        $response->assertStatus(201)
            ->assertJson([
                'data' => [
                    'brand' => 'Toyota',
                    'model' => 'Camry',
                    'year' => 2023,
                    'status' => 'active',
                ],
            ]);

        $this->assertDatabaseHas('cars', [
            'brand' => 'Toyota',
            'model' => 'Camry',
        ]);
    }

    public function test_can_show_car(): void
    {
        $car = Car::factory()->create(['brand' => 'Honda', 'model' => 'Civic']);

        $response = $this->getJson('/api/v1/cars/' . $car->id);

        $response->assertStatus(200)
            ->assertJson(['data' => ['brand' => 'Honda', 'model' => 'Civic']]);
    }

    public function test_returns_404_for_missing_car(): void
    {
        $response = $this->getJson('/api/v1/cars/999999');

        $response->assertStatus(404);
    }

    public function test_can_update_car(): void
    {
        $car = Car::factory()->create(['status' => 'active']);

        $response = $this->putJson('/api/v1/cars/' . $car->id, [
            'status' => 'sold',
        ]);

        $response->assertStatus(200)
            ->assertJson(['data' => ['status' => 'sold']]);

        $this->assertDatabaseHas('cars', [
            'id' => $car->id,
            'status' => 'sold',
        ]);
    }

    public function test_can_delete_car(): void
    {
        $car = Car::factory()->create();

        $response = $this->deleteJson('/api/v1/cars/' . $car->id);

        $response->assertStatus(204);

        $this->assertDatabaseMissing('cars', ['id' => $car->id]);
    }

    public function test_validation_requires_brand_and_model(): void
    {
        $response = $this->postJson('/api/v1/cars', []);

        $response->assertStatus(422)
            ->assertJsonValidationErrors(['brand', 'model']);
    }
}
