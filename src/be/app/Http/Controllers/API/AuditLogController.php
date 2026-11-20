<?php

declare(strict_types=1);

namespace DDD\Http\Controllers\API;

use DDD\Application\AuditLog\DTOs\AuditLogData;
use DDD\Application\AuditLog\UseCases\CreateAuditLogUseCase;
use DDD\Application\AuditLog\UseCases\ListAuditLogsUseCase;
use DDD\Domain\Shared\Criteria\Pagination;
use DDD\Http\Controllers\Controller;
use DDD\Http\Requests\StoreAuditLogRequest;
use DDD\Http\Resources\AuditLogResource;
use DDD\Http\Resources\AuditLogResourceCollection;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class AuditLogController extends Controller
{
    public function __construct(
        private readonly ListAuditLogsUseCase $listAuditLogs,
        private readonly CreateAuditLogUseCase $createAuditLog,
    ) {}

    public function index(Request $request): AuditLogResourceCollection
    {
        $page = (int) $request->query('page', 1);
        $perPage = (int) $request->query('per_page', 15);

        $logs = $this->listAuditLogs->execute(
            Pagination::create($page, $perPage)
        );

        return new AuditLogResourceCollection($logs);
    }

    public function store(StoreAuditLogRequest $request, CreateAuditLogUseCase $createAuditLogUseCase): JsonResponse
    {
        $data = AuditLogData::fromRequest($request->validated());

        $log = $createAuditLogUseCase->execute($data);

        return response()->json(new AuditLogResource($log), Response::HTTP_CREATED);
    }

    public function show(string $id): JsonResponse
    {
        $logs = $this->listAuditLogs->execute();

        $log = collect($logs)->first(fn ($l) => (string) $l->getKey() === $id);

        if ($log === null) {
            return response()->json(['message' => 'Audit log not found'], Response::HTTP_NOT_FOUND);
        }

        return response()->json(new AuditLogResource($log));
    }
}
