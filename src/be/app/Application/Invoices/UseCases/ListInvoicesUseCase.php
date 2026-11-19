<?php

declare(strict_types=1);

namespace DDD\Application\Invoices\UseCases;

use DDD\Domain\Invoices\Invoice;
use DDD\Domain\Invoices\Repository\InvoiceRepositoryInterface;
use DDD\Domain\Shared\Criteria\Pagination;

class ListInvoicesUseCase
{
    public function __construct(
        private readonly InvoiceRepositoryInterface $invoiceRepository,
    ) {
    }

    public function execute(?Pagination $pagination = null): array
    {
        return $this->invoiceRepository->findAll($pagination);
    }
}
