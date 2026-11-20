<?php

declare(strict_types=1);

namespace DDD\Http\Resources;

use DDD\Domain\Notifications\Notification;
use DDD\Domain\Notifications\ValueObjects\NotificationChannel;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class NotificationResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        /** @var Notification $this->resource */
        $notification = $this->resource;

        return [
            'id' => (string) $notification->getKey(),
            'recipient_type' => $notification->recipientType(),
            'recipient_id' => $notification->recipient_id,
            'channel' => (string) (($channel = $notification->channel) instanceof NotificationChannel ? $channel : NotificationChannel::from(empty($channel) ? NotificationChannel::EMAIL : $channel)),
            'subject' => $notification->subject,
            'content' => $notification->content,
            'status' => (string) $notification->status,
            'is_sent' => $notification->isSent(),
            'sent_at' => $notification->sent_at?->toISOString(),
            'created_at' => $notification->created_at?->toISOString(),
            'updated_at' => $notification->updated_at?->toISOString(),
        ];
    }
}
