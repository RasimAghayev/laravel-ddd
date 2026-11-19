<?php

declare(strict_types=1);

namespace DDD\Http\Resources;

use DDD\Domain\AuditLog\AuditLog;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class AuditLogResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        /** @var AuditLog $this->resource */
        $log = $this->resource;

        return [
            'id' => (string) $log->getKey(),
            'actor_type' => $log->actorType(),
            'actor_id' => $log->actorId(),
            'action' => $log->action(),
            'subject_type' => $log->subjectType(),
            'subject_id' => $log->subjectId(),
            'changes' => $log->changes(),
            'created_at' => $log->created_at?->toISOString(),
        ];
    }
}
