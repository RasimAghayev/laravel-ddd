<?php

declare(strict_types=1);

namespace DDD\Application\Notifications\UseCases;

use DDD\Application\Notifications\DTOs\NotificationData;
use DDD\Domain\Notifications\Notification;
use DDD\Domain\Notifications\Repository\NotificationRepositoryInterface;

class CreateNotificationUseCase
{
    public function __construct(
        private readonly NotificationRepositoryInterface $notificationRepository,
    ) {}

    public function execute(NotificationData $data): Notification
    {
        $notification = new Notification;
        $notification->recipient_type = $data->recipientType;
        $notification->recipient_id = $data->recipientId;
        $notification->channel = $data->channel;
        $notification->subject = $data->subject;
        $notification->content = $data->content;
        $notification->status = $data->status;

        $this->notificationRepository->save($notification);

        return $notification;
    }
}
