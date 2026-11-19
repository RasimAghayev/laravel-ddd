<?php

declare(strict_types=1);

namespace DDD\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateNotificationRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'recipient_type' => ['sometimes', 'string', 'max:50'],
            'recipient_id' => ['sometimes', 'string', 'max:255'],
            'channel' => ['sometimes', 'string', 'in:email,sms,push,webhook'],
            'subject' => ['sometimes', 'string', 'max:255'],
            'content' => ['sometimes', 'string'],
            'status' => ['sometimes', 'string', 'in:pending,sent,failed,read'],
        ];
    }
}
