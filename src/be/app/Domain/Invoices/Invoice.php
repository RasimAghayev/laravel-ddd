<?php

declare(strict_types=1);

namespace DDD\Domain\Invoices;

use DDD\Domain\Invoices\ValueObjects\InvoiceStatus;
use DDD\Domain\Orders\Order;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Invoice extends Model
{
    use HasFactory;

    protected $table = 'invoices';

    protected $guarded = [];

    protected $casts = [
        'amount_cents' => 'integer',
        'due_at' => 'datetime',
    ];

    public function order(): BelongsTo
    {
        return $this->belongsTo(Order::class, 'order_id');
    }

    public function invoiceNumber(): string
    {
        return 'INV-'.str_pad((string) $this->getKey(), 8, '0', STR_PAD_LEFT);
    }

    public function amount(): string
    {
        return number_format($this->amount_cents / 100, 2, '.', '').' '.($this->currency ?? 'USD');
    }

    public function isPaid(): bool
    {
        $status = $this->getAttribute('status');

        if ($status instanceof InvoiceStatus) {
            return $status->isPaid();
        }

        return InvoiceStatus::from($status ?? InvoiceStatus::DRAFT)->isPaid();
    }

    public function issue(): void
    {
        $this->status = InvoiceStatus::from(InvoiceStatus::ISSUED);
    }

    public function pay(): void
    {
        $this->status = InvoiceStatus::from(InvoiceStatus::PAID);
    }

    public function void(): void
    {
        $this->status = InvoiceStatus::from(InvoiceStatus::VOID);
    }

    public function overdue(): bool
    {
        return $this->due_at && $this->due_at->isPast() && ! $this->isPaid();
    }
}
