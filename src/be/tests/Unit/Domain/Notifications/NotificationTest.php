<?php

declare(strict_types=1);

namespace Tests\Unit\Domain\Notifications;

use DDD\Domain\Notifications\Notification;
use DDD\Domain\Notifications\ValueObjects\NotificationChannel;
use DDD\Domain\Notifications\ValueObjects\NotificationStatus;
use PHPUnit\Framework\TestCase;

class NotificationTest extends TestCase
{
    public function test_notification_has_default_pending_status(): void
    {
        $notification = new Notification();
        $notification->recipient_type = 'user';
        $notification->recipient_id = 'user-123';
        $notification->channel = NotificationChannel::from(NotificationChannel::EMAIL);
        $notification->subject = 'Test';
        $notification->content = 'Test content';
        $notification->status = NotificationStatus::from(NotificationStatus::PENDING);

        $this->assertFalse($notification->isSent());
        $this->assertSame(NotificationStatus::PENDING, (string) $notification->status);
    }

    public function test_notification_can_be_marked_sent(): void
    {
        $notification = new Notification();
        $notification->status = NotificationStatus::from(NotificationStatus::PENDING);
        $notification->markSent();

        $this->assertTrue($notification->isSent());
    }

    public function test_notification_can_fail(): void
    {
        $notification = new Notification();
        $notification->status = NotificationStatus::from(NotificationStatus::PENDING);
        $notification->markFailed();

        $this->assertTrue($notification->status->isFailed());
    }

    public function test_notification_can_be_marked_read(): void
    {
        $notification = new Notification();
        $notification->status = NotificationStatus::from(NotificationStatus::SENT);
        $notification->markRead();

        $this->assertTrue($notification->status->isRead());
    }

    public function test_notification_status_rejects_invalid_value(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        NotificationStatus::from('invalid_status');
    }

    public function test_notification_channel_rejects_invalid_value(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        NotificationChannel::from('invalid_channel');
    }
}
