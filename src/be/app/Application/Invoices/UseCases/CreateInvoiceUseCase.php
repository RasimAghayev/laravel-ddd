<?php

declare(strict_types=1);

namespace DDD\Application\Invoices\UseCases;

use DDD\Application\Invoices\DTOs\InvoiceData;
use DDD\Domain\Invoices\Invoice;
use DDD\Domain\Invoices\Repository\InvoiceRepositoryInterface;

class CreateInvoiceUseCase
{
    public function __construct(
        private readonly InvoiceRepositoryInterface $invoiceRepository,
    ) {}

    public function execute(InvoiceData $data): Invoice
    {
        $invoice = new Invoice;
        $invoice->order_id = $data->orderId;
        $invoice->amount_cents = $data->amountCents;
        $invoice->currency = $data->currency;
        $invoice->status = $data->status;
        $invoice->due_at = $data->dueAt;

        $this->invoiceRepository->save($invoice);

        return $invoice;
    }
}
