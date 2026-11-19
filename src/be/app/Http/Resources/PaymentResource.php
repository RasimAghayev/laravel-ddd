<?php

declare(strict_types=1);

namespace DDD\Http\Resources;

use DDD\Domain\Payments\Payment;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PaymentResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        /** @var Payment $this->resource */
        $payment = $this->resource;

        return [
            'id' => (string) $payment->getKey(),
            'order_id' => $payment->order_id,
            'amount' => $payment->amount(),
            'amount_cents' => $payment->amount_cents,
            'currency' => $payment->currency,
            'method' => (string) $payment->method,
            'status' => (string) $payment->status,
            'is_paid' => $payment->isPaid(),
            'transaction_reference' => $payment->transactionReference(),
            'paid_at' => $payment->paid_at?->toISOString(),
            'created_at' => $payment->created_at?->toISOString(),
            'updated_at' => $payment->updated_at?->toISOString(),
        ];
    }
}
