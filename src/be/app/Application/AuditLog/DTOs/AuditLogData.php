<?php

declare(strict_types=1);

namespace DDD\Application\AuditLog\DTOs;

final class AuditLogData
{
    public function __construct(
        public readonly ?string $id,
        public readonly ?string $actorType,
        public readonly ?string $actorId,
        public readonly string $action,
        public readonly ?string $subjectType,
        public readonly ?string $subjectId,
        public readonly array $changes,
    ) {
    }

    public static function fromRequest(array $data): self
    {
        return new self(
            id: $data['id'] ?? null,
            actorType: $data['actor_type'] ?? null,
            actorId: $data['actor_id'] ?? null,
            action: $data['action'],
            subjectType: $data['subject_type'] ?? null,
            subjectId: $data['subject_id'] ?? null,
            changes: $data['changes'] ?? [],
        );
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'actor_type' => $this->actorType,
            'actor_id' => $this->actorId,
            'action' => $this->action,
            'subject_type' => $this->subjectType,
            'subject_id' => $this->subjectId,
            'changes' => $this->changes,
        ];
    }
}
