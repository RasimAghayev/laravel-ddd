<?php

declare(strict_types=1);

namespace DDD\Application\Notifications\UseCases;

use DDD\Application\Notifications\DTOs\NotificationData;
use DDD\Domain\Notifications\Notification;
use DDD\Domain\Notifications\Repository\NotificationRepositoryInterface;

class UpdateNotificationUseCase
{
    public function __construct(
        private readonly NotificationRepositoryInterface $notificationRepository,
    ) {}

    public function execute(string $id, NotificationData $data): ?Notification
    {
        $notification = $this->notificationRepository->findById($id);

        if ($notification === null) {
            return null;
        }

        $notification->recipient_type = $data->recipientType ?? '';
        $notification->recipient_id = $data->recipientId ?? '';
        $notification->channel = (string) $data->channel;
        $notification->subject = $data->subject ?? '';
        $notification->content = $data->content ?? '';
        $notification->status = (string) $data->status;

        $this->notificationRepository->save($notification);

        return $notification;
    }
}
