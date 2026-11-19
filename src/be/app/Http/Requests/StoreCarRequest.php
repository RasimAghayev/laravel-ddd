<?php

declare(strict_types=1);

namespace DDD\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreCarRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'brand' => ['required', 'string', 'max:100'],
            'model' => ['required', 'string', 'max:100'],
            'year' => ['required', 'integer', 'min:1900', 'max:' . (date('Y') + 1)],
            'price' => ['required', 'numeric', 'min:0'],
            'currency' => ['sometimes', 'string', 'size:3', 'in:USD,EUR,AZN'],
            'status' => ['sometimes', 'string', 'in:active,sold,reserved,maintenance'],
        ];
    }

    public function messages(): array
    {
        return [
            'brand.required' => 'Brand is required.',
            'model.required' => 'Model is required.',
            'year.required' => 'Year is required.',
            'price.required' => 'Price is required.',
        ];
    }
}
