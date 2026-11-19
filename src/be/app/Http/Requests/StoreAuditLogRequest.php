<?php

declare(strict_types=1);

namespace DDD\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreAuditLogRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'action' => ['required', 'string', 'max:100'],
            'actor_type' => ['sometimes', 'string', 'max:50'],
            'actor_id' => ['sometimes', 'string', 'max:255'],
            'subject_type' => ['sometimes', 'string', 'max:50'],
            'subject_id' => ['sometimes', 'string', 'max:255'],
            'changes' => ['sometimes', 'array'],
        ];
    }
}
