<?php

declare(strict_types=1);

namespace DDD\Http\Resources;

use DDD\Domain\Invoices\Invoice;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class InvoiceResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        /** @var Invoice $this->resource */
        $invoice = $this->resource;

        return [
            'id' => (string) $invoice->getKey(),
            'invoice_number' => $invoice->invoiceNumber(),
            'order_id' => $invoice->order_id,
            'amount' => $invoice->amount(),
            'amount_cents' => $invoice->amount_cents,
            'currency' => $invoice->currency,
            'status' => (string) $invoice->status,
            'is_paid' => $invoice->isPaid(),
            'due_at' => $invoice->due_at?->toISOString(),
            'created_at' => $invoice->created_at?->toISOString(),
            'updated_at' => $invoice->updated_at?->toISOString(),
        ];
    }
}
