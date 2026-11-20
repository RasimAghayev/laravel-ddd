<?php

declare(strict_types=1);

namespace DDD\Application\Invoices\UseCases;

use DDD\Application\Invoices\DTOs\InvoiceData;
use DDD\Domain\Invoices\Invoice;
use DDD\Domain\Invoices\Repository\InvoiceRepositoryInterface;

class UpdateInvoiceUseCase
{
    public function __construct(
        private readonly InvoiceRepositoryInterface $invoiceRepository,
    ) {}

    public function execute(string $id, InvoiceData $data): ?Invoice
    {
        $invoice = $this->invoiceRepository->findById($id);

        if ($invoice === null) {
            return null;
        }

        if ($data->orderId !== null) {
            $invoice->order_id = $data->orderId;
        }
        $invoice->amount_cents = $data->amountCents;
        $invoice->currency = $data->currency;
        $invoice->status = (string) $data->status;
        $invoice->due_at = $data->dueAt;

        $this->invoiceRepository->save($invoice);

        return $invoice;
    }
}
