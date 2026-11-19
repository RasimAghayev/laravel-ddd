<?php

declare(strict_types=1);

namespace DDD\Infrastructure\Persistence\Eloquent\Invoices;

use DDD\Domain\Invoices\Invoice;
use DDD\Domain\Invoices\Repository\InvoiceRepositoryInterface;
use DDD\Domain\Invoices\ValueObjects\InvoiceStatus;
use DDD\Domain\Shared\Criteria\Pagination;

class EloquentInvoiceRepository implements InvoiceRepositoryInterface
{
    public function findById(string $id): ?Invoice
    {
        return Invoice::find($id);
    }

    public function findByOrderId(string $orderId): ?Invoice
    {
        return Invoice::where('order_id', $orderId)->first();
    }

    public function findAll(?Pagination $pagination = null): array
    {
        $query = Invoice::query();

        if ($pagination !== null) {
            $query->offset($pagination->offset())->limit($pagination->perPage);
        }

        return $query->get()->all();
    }

    public function findByStatus(InvoiceStatus $status, ?Pagination $pagination = null): array
    {
        $query = Invoice::where('status', $status->value);

        if ($pagination !== null) {
            $query->offset($pagination->offset())->limit($pagination->perPage);
        }

        return $query->get()->all();
    }

    public function save(Invoice $invoice): void
    {
        $invoice->save();
    }

    public function delete(Invoice $invoice): void
    {
        $invoice->delete();
    }

    public function count(): int
    {
        return Invoice::count();
    }
}
