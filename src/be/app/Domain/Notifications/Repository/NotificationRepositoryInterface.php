<?php

declare(strict_types=1);

namespace DDD\Domain\Notifications\Repository;

use DDD\Domain\Notifications\Notification;
use DDD\Domain\Notifications\ValueObjects\NotificationStatus;
use DDD\Domain\Shared\Criteria\Pagination;

interface NotificationRepositoryInterface
{
    public function findById(string $id): ?Notification;

    public function findByRecipient(string $recipientType, string $recipientId, ?Pagination $pagination = null): array;

    public function findAll(?Pagination $pagination = null): array;

    public function findByStatus(NotificationStatus $status, ?Pagination $pagination = null): array;

    public function save(Notification $notification): void;

    public function delete(Notification $notification): void;

    public function count(): int;
}
