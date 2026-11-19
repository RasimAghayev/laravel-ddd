<?php

declare(strict_types=1);

namespace DDD\Domain\AuditLog;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AuditLog extends Model
{
    use HasFactory;

    protected $table = 'audit_logs';

    protected $guarded = [];

    protected $casts = [
        'created_at' => 'datetime',
    ];

    public function actorType(): ?string
    {
        return $this->actor_type;
    }

    public function actorId(): ?string
    {
        return $this->actor_id;
    }

    public function action(): string
    {
        return $this->action;
    }

    public function subjectType(): ?string
    {
        return $this->subject_type;
    }

    public function subjectId(): ?string
    {
        return $this->subject_id;
    }

    public function changes(): array
    {
        return $this->changes ?? [];
    }
}
