<?php

declare(strict_types=1);

namespace DDD\Application\Notifications\DTOs;

use DDD\Domain\Notifications\ValueObjects\NotificationStatus;

final class NotificationData
{
    public function __construct(
        public readonly ?string $id,
        public readonly string $recipientType,
        public readonly string $recipientId,
        public readonly string $channel,
        public readonly string $subject,
        public readonly string $content,
        public readonly NotificationStatus $status,
    ) {
    }

    public static function fromRequest(array $data): self
    {
        return new self(
            id: $data['id'] ?? null,
            recipientType: $data['recipient_type'],
            recipientId: $data['recipient_id'],
            channel: $data['channel'],
            subject: $data['subject'],
            content: $data['content'],
            status: NotificationStatus::from($data['status'] ?? NotificationStatus::PENDING),
        );
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'recipient_type' => $this->recipientType,
            'recipient_id' => $this->recipientId,
            'channel' => $this->channel,
            'subject' => $this->subject,
            'content' => $this->content,
            'status' => (string) $this->status,
        ];
    }
}
