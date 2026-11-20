<?php

declare(strict_types=1);

namespace DDD\Domain\Payments;

use DDD\Domain\Orders\Order;
use DDD\Domain\Payments\ValueObjects\PaymentStatus;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Payment extends Model
{
    use HasFactory;

    protected $table = 'payments';

    protected $guarded = [];

    protected $casts = [
        'amount_cents' => 'integer',
        'paid_at' => 'datetime',
    ];

    public function order(): BelongsTo
    {
        return $this->belongsTo(Order::class, 'order_id');
    }

    public function transactionReference(): ?string
    {
        return $this->transaction_reference;
    }

    public function amount(): string
    {
        return number_format($this->amount_cents / 100, 2, '.', '').' '.($this->currency ?? 'USD');
    }

    public function isPaid(): bool
    {
        $status = $this->getAttribute('status');

        if ($status instanceof PaymentStatus) {
            return $status->isPaid();
        }

        return PaymentStatus::from($status ?? PaymentStatus::PENDING)->isPaid();
    }

    public function complete(string $transactionReference): void
    {
        $this->status = PaymentStatus::from(PaymentStatus::COMPLETED);
        $this->transaction_reference = $transactionReference;
    }

    public function fail(): void
    {
        $this->status = PaymentStatus::from(PaymentStatus::FAILED);
    }

    public function refund(): void
    {
        $this->status = PaymentStatus::from(PaymentStatus::REFUNDED);
    }
}
