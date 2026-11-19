<?php

declare(strict_types=1);

namespace DDD\Infrastructure\Persistence\Eloquent\AuditLog;

use DDD\Domain\AuditLog\AuditLog;
use DDD\Domain\AuditLog\Repository\AuditLogRepositoryInterface;
use DDD\Domain\Shared\Criteria\Pagination;

class EloquentAuditLogRepository implements AuditLogRepositoryInterface
{
    public function findById(string $id): ?AuditLog
    {
        return AuditLog::find($id);
    }

    public function findAll(?Pagination $pagination = null): array
    {
        $query = AuditLog::query()->latest();

        if ($pagination !== null) {
            $query->offset($pagination->offset())->limit($pagination->perPage);
        }

        return $query->get()->all();
    }

    public function findByActor(string $actorId, ?Pagination $pagination = null): array
    {
        $query = AuditLog::where('actor_id', $actorId)->latest();

        if ($pagination !== null) {
            $query->offset($pagination->offset())->limit($pagination->perPage);
        }

        return $query->get()->all();
    }

    public function findBySubject(string $subjectType, string $subjectId, ?Pagination $pagination = null): array
    {
        $query = AuditLog::where('subject_type', $subjectType)
            ->where('subject_id', $subjectId)
            ->latest();

        if ($pagination !== null) {
            $query->offset($pagination->offset())->limit($pagination->perPage);
        }

        return $query->get()->all();
    }

    public function save(AuditLog $auditLog): void
    {
        $auditLog->save();
    }

    public function count(): int
    {
        return AuditLog::count();
    }
}
