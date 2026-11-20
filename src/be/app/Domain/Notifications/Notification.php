<?php

declare(strict_types=1);

namespace DDD\Domain\Notifications;

use DDD\Domain\Notifications\ValueObjects\NotificationStatus;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{
    use HasFactory;

    protected $table = 'notifications';

    protected $guarded = [];

    protected $casts = [
        'sent_at' => 'datetime',
        'recipient_id' => 'string',
    ];

    public function recipientType(): ?string
    {
        return $this->recipient_type;
    }

    public function isSent(): bool
    {
        $status = $this->getAttribute('status');

        if ($status instanceof NotificationStatus) {
            return $status->isSent();
        }

        return NotificationStatus::from($status ?? NotificationStatus::PENDING)->isSent();
    }

    public function markSent(): void
    {
        $this->status = NotificationStatus::from(NotificationStatus::SENT);
    }

    public function markFailed(): void
    {
        $this->status = NotificationStatus::from(NotificationStatus::FAILED);
    }

    public function markRead(): void
    {
        $this->status = NotificationStatus::from(NotificationStatus::READ);
    }
}
