<?php

declare(strict_types=1);

namespace Tests\Unit\Domain\AuditLog;

use DDD\Domain\AuditLog\AuditLog;
use PHPUnit\Framework\TestCase;

class AuditLogTest extends TestCase
{
    public function test_audit_log_stores_action_and_subject(): void
    {
        $log = new AuditLog();
        $log->actor_type = 'user';
        $log->actor_id = 'user-123';
        $log->action = 'create';
        $log->subject_type = 'Order';
        $log->subject_id = 'order-456';
        $log->changes = ['before' => null, 'after' => ['status' => 'pending']];

        $this->assertSame('create', $log->action());
        $this->assertSame('Order', $log->subjectType());
        $this->assertSame('order-456', $log->subjectId());
        $this->assertSame('user-123', $log->actorId());
    }

    public function test_audit_log_returns_changes_array(): void
    {
        $log = new AuditLog();
        $log->changes = ['before' => null, 'after' => ['status' => 'active']];

        $this->assertIsArray($log->changes());
        $this->assertSame('active', $log->changes()['after']['status']);
    }
}
