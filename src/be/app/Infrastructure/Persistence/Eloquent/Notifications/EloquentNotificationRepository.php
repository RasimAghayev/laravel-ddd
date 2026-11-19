<?php

declare(strict_types=1);

namespace DDD\Infrastructure\Persistence\Eloquent\Notifications;

use DDD\Domain\Notifications\Notification;
use DDD\Domain\Notifications\Repository\NotificationRepositoryInterface;
use DDD\Domain\Notifications\ValueObjects\NotificationStatus;
use DDD\Domain\Shared\Criteria\Pagination;

class EloquentNotificationRepository implements NotificationRepositoryInterface
{
    public function findById(string $id): ?Notification
    {
        return Notification::find($id);
    }

    public function findByRecipient(string $recipientType, string $recipientId, ?Pagination $pagination = null): array
    {
        $query = Notification::where('recipient_type', $recipientType)
            ->where('recipient_id', $recipientId);

        if ($pagination !== null) {
            $query->offset($pagination->offset())->limit($pagination->perPage);
        }

        return $query->get()->all();
    }

    public function findAll(?Pagination $pagination = null): array
    {
        $query = Notification::query()->latest();

        if ($pagination !== null) {
            $query->offset($pagination->offset())->limit($pagination->perPage);
        }

        return $query->get()->all();
    }

    public function findByStatus(NotificationStatus $status, ?Pagination $pagination = null): array
    {
        $query = Notification::where('status', $status->value)->latest();

        if ($pagination !== null) {
            $query->offset($pagination->offset())->limit($pagination->perPage);
        }

        return $query->get()->all();
    }

    public function save(Notification $notification): void
    {
        $notification->save();
    }

    public function delete(Notification $notification): void
    {
        $notification->delete();
    }

    public function count(): int
    {
        return Notification::count();
    }
}
