<?php

declare(strict_types=1);

namespace DDD\Application\AuditLog\UseCases;

use DDD\Application\AuditLog\DTOs\AuditLogData;
use DDD\Domain\AuditLog\AuditLog;
use DDD\Domain\AuditLog\Repository\AuditLogRepositoryInterface;

class CreateAuditLogUseCase
{
    public function __construct(
        private readonly AuditLogRepositoryInterface $auditLogRepository,
    ) {
    }

    public function execute(AuditLogData $data): AuditLog
    {
        $auditLog = new AuditLog();
        $auditLog->actor_type = $data->actorType;
        $auditLog->actor_id = $data->actorId;
        $auditLog->action = $data->action;
        $auditLog->subject_type = $data->subjectType;
        $auditLog->subject_id = $data->subjectId;
        $auditLog->changes = $data->changes;

        $this->auditLogRepository->save($auditLog);

        return $auditLog;
    }
}
