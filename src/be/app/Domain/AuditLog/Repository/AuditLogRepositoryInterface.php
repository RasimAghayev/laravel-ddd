<?php

declare(strict_types=1);

namespace DDD\Domain\AuditLog\Repository;

use DDD\Domain\AuditLog\AuditLog;
use DDD\Domain\Shared\Criteria\Pagination;

interface AuditLogRepositoryInterface
{
    public function findById(string $id): ?AuditLog;

    public function findAll(?Pagination $pagination = null): array;

    public function findByActor(string $actorId, ?Pagination $pagination = null): array;

    public function findBySubject(string $subjectType, string $subjectId, ?Pagination $pagination = null): array;

    public function save(AuditLog $auditLog): void;

    public function count(): int;
}
