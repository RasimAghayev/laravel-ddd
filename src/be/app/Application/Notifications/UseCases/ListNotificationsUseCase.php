<?php

declare(strict_types=1);

namespace DDD\Application\Notifications\UseCases;

use DDD\Domain\Notifications\Repository\NotificationRepositoryInterface;
use DDD\Domain\Shared\Criteria\Pagination;

class ListNotificationsUseCase
{
    public function __construct(
        private readonly NotificationRepositoryInterface $notificationRepository,
    ) {}

    public function execute(?Pagination $pagination = null): array
    {
        return $this->notificationRepository->findAll($pagination);
    }
}
