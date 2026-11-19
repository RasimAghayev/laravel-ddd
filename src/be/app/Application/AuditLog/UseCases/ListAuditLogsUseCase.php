<?php

declare(strict_types=1);

namespace DDD\Application\AuditLog\UseCases;

use DDD\Domain\AuditLog\AuditLog;
use DDD\Domain\AuditLog\Repository\AuditLogRepositoryInterface;
use DDD\Domain\Shared\Criteria\Pagination;

class ListAuditLogsUseCase
{
    public function __construct(
        private readonly AuditLogRepositoryInterface $auditLogRepository,
    ) {
    }

    public function execute(?Pagination $pagination = null): array
    {
        return $this->auditLogRepository->findAll($pagination);
    }
}
