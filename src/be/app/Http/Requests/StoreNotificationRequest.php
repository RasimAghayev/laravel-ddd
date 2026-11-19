<?php

declare(strict_types=1);

namespace DDD\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreNotificationRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'recipient_type' => ['required', 'string', 'max:50'],
            'recipient_id' => ['required', 'string', 'max:255'],
            'channel' => ['sometimes', 'string', 'in:email,sms,push,webhook'],
            'subject' => ['required', 'string', 'max:255'],
            'content' => ['required', 'string'],
            'status' => ['sometimes', 'string', 'in:pending,sent,failed,read'],
        ];
    }

    public function messages(): array
    {
        return [
            'recipient_type.required' => 'Recipient type is required.',
            'recipient_id.required' => 'Recipient ID is required.',
            'subject.required' => 'Subject is required.',
            'content.required' => 'Content is required.',
        ];
    }
}
