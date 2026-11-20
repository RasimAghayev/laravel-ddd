<?php

declare(strict_types=1);

namespace DDD\Application\Notifications\UseCases;

use DDD\Domain\Notifications\Repository\NotificationRepositoryInterface;

class DeleteNotificationUseCase
{
    public function __construct(
        private readonly NotificationRepositoryInterface $notificationRepository,
    ) {}

    public function execute(string $id): bool
    {
        $notification = $this->notificationRepository->findById($id);

        if ($notification === null) {
            return false;
        }

        $this->notificationRepository->delete($notification);

        return true;
    }
}
