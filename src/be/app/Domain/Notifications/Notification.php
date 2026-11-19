<?php

declare(strict_types=1);

namespace DDD\Domain\Notifications;

use DDD\Domain\Notifications\ValueObjects\NotificationChannel;
use DDD\Domain\Notifications\ValueObjects\NotificationStatus;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{
    use HasFactory;

    protected $table = 'notifications';

    protected $guarded = [];

    protected $casts = [
        'channel' => NotificationChannel::class,
        'status' => NotificationStatus::class,
        'sent_at' => 'datetime',
        'recipient_id' => 'string',
    ];

    public function recipientType(): ?string
    {
        return $this->recipient_type;
    }

    public function channel(): NotificationChannel
    {
        return $this->channel ?? NotificationChannel::from(NotificationChannel::EMAIL);
    }

    public function status(): NotificationStatus
    {
        return $this->status ?? NotificationStatus::from(NotificationStatus::PENDING);
    }

    public function isSent(): bool
    {
        return $this->status->isSent();
    }

    public function markSent(): void
    {
        $this->status = NotificationStatus::SENT;
        $this->sent_at = now();
        $this->save();
    }

    public function markFailed(): void
    {
        $this->status = NotificationStatus::FAILED;
        $this->save();
    }

    public function markRead(): void
    {
        $this->status = NotificationStatus::READ;
        $this->save();
    }
}
