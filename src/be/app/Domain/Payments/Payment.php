<?php

declare(strict_types=1);

namespace DDD\Domain\Payments;

use DDD\Domain\Payments\ValueObjects\PaymentMethod;
use DDD\Domain\Payments\ValueObjects\PaymentStatus;
use DDD\Domain\Orders\Order;
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
        'status' => PaymentStatus::class,
        'method' => PaymentMethod::class,
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
        return number_format($this->amount_cents / 100, 2, '.', '') . ' ' . ($this->currency ?? 'USD');
    }

    public function status(): PaymentStatus
    {
        return $this->status ?? PaymentStatus::from(PaymentStatus::PENDING);
    }

    public function isPaid(): bool
    {
        return $this->status->isPaid();
    }

    public function complete(string $transactionReference): void
    {
        $this->status = PaymentStatus::COMPLETED;
        $this->transaction_reference = $transactionReference;
        $this->paid_at = now();
        $this->save();
    }

    public function fail(): void
    {
        $this->status = PaymentStatus::FAILED;
        $this->save();
    }

    public function refund(): void
    {
        $this->status = PaymentStatus::REFUNDED;
        $this->save();
    }
}
