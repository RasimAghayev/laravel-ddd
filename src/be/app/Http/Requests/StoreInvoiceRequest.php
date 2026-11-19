<?php

declare(strict_types=1);

namespace DDD\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreInvoiceRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'order_id' => ['required', 'string', 'exists:orders,id'],
            'amount_cents' => ['required', 'integer', 'min:0'],
            'currency' => ['sometimes', 'string', 'size:3', 'in:USD,EUR,AZN'],
            'status' => ['sometimes', 'string', 'in:draft,issued,paid,overdue,void'],
            'due_at' => ['sometimes', 'date'],
        ];
    }

    public function messages(): array
    {
        return [
            'order_id.required' => 'Order ID is required.',
            'amount_cents.required' => 'Amount is required.',
        ];
    }
}
