<?php

declare(strict_types=1);

namespace DDD\Application\Invoices\UseCases;

use DDD\Domain\Invoices\Repository\InvoiceRepositoryInterface;

class DeleteInvoiceUseCase
{
    public function __construct(
        private readonly InvoiceRepositoryInterface $invoiceRepository,
    ) {}

    public function execute(string $id): bool
    {
        $invoice = $this->invoiceRepository->findById($id);

        if ($invoice === null) {
            return false;
        }

        $this->invoiceRepository->delete($invoice);

        return true;
    }
}
