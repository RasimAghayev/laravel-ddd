<?php

declare(strict_types=1);

namespace Tests\Feature\AuditLog;

use DDD\Domain\AuditLog\AuditLog;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class AuditLogApiTest extends TestCase
{
    use RefreshDatabase;

    public function test_can_list_audit_logs(): void
    {
        AuditLog::factory()->count(3)->create();

        $response = $this->getJson('/api/v1/audit-logs');

        $response->assertStatus(200)
            ->assertJsonStructure([
                'data' => [
                    '*' => [
                        'id', 'action', 'actor_type', 'subject_type',
                    ],
                ],
                'meta',
            ]);
    }

    public function test_can_create_audit_log(): void
    {
        $response = $this->postJson('/api/v1/audit-logs', [
            'action' => 'create',
            'actor_type' => 'user',
            'actor_id' => 'user-123',
            'subject_type' => 'Order',
            'subject_id' => 'order-456',
            'changes' => ['before' => null, 'after' => ['status' => 'pending']],
        ]);

        $response->assertStatus(201)
            ->assertJson([
                'data' => [
                    'action' => 'create',
                    'actor_type' => 'user',
                    'subject_type' => 'Order',
                ],
            ]);

        $this->assertDatabaseHas('audit_logs', [
            'action' => 'create',
            'subject_type' => 'Order',
        ]);
    }

    public function test_can_show_audit_log(): void
    {
        $log = AuditLog::factory()->create(['action' => 'update']);

        $response = $this->getJson('/api/v1/audit-logs/'.$log->id);

        $response->assertStatus(200)
            ->assertJson(['data' => ['action' => 'update']]);
    }

    public function test_returns_404_for_missing_audit_log(): void
    {
        $response = $this->getJson('/api/v1/audit-logs/999999');

        $response->assertStatus(404);
    }

    public function test_validation_requires_action(): void
    {
        $response = $this->postJson('/api/v1/audit-logs', []);

        $response->assertStatus(422)
            ->assertJsonValidationErrors(['action']);
    }
}
