<?php

declare(strict_types=1);

namespace DDD\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdatePaymentRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'order_id' => ['sometimes', 'string', 'exists:orders,id'],
            'amount_cents' => ['sometimes', 'integer', 'min:0'],
            'currency' => ['sometimes', 'string', 'size:3', 'in:USD,EUR,AZN'],
            'method' => ['sometimes', 'string', 'in:credit_card,bank_transfer,paypal,cash'],
            'status' => ['sometimes', 'string', 'in:pending,completed,failed,refunded,cancelled'],
            'transaction_reference' => ['sometimes', 'string', 'max:255'],
        ];
    }
}
