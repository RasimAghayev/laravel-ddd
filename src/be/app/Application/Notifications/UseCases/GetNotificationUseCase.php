<?php

declare(strict_types=1);

namespace DDD\Application\Notifications\UseCases;

use DDD\Domain\Notifications\Notification;
use DDD\Domain\Notifications\Repository\NotificationRepositoryInterface;

class GetNotificationUseCase
{
    public function __construct(
        private readonly NotificationRepositoryInterface $notificationRepository,
    ) {
    }

    public function execute(string $id): ?Notification
    {
        return $this->notificationRepository->findById($id);
    }
}
