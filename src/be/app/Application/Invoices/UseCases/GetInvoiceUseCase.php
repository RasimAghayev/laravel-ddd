<?php

declare(strict_types=1);

namespace DDD\Application\Invoices\UseCases;

use DDD\Domain\Invoices\Invoice;
use DDD\Domain\Invoices\Repository\InvoiceRepositoryInterface;

class GetInvoiceUseCase
{
    public function __construct(
        private readonly InvoiceRepositoryInterface $invoiceRepository,
    ) {
    }

    public function execute(string $id): ?Invoice
    {
        return $this->invoiceRepository->findById($id);
    }
}
