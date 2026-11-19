<?php

declare(strict_types=1);

namespace DDD\Domain\Invoices\Repository;

use DDD\Domain\Invoices\Invoice;
use DDD\Domain\Shared\Criteria\Pagination;

interface InvoiceRepositoryInterface
{
    public function findById(string $id): ?Invoice;

    public function findByOrderId(string $orderId): ?Invoice;

    public function findAll(?Pagination $pagination = null): array;

    public function findByStatus(InvoiceStatus $status, ?Pagination $pagination = null): array;

    public function save(Invoice $invoice): void;

    public function delete(Invoice $invoice): void;

    public function count(): int;
}
