<?php

declare(strict_types=1);

namespace DDD\Domain\Orders;

use DDD\Domain\Orders\ValueObjects\OrderStatus;
use DDD\Domain\Users\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Order extends Model
{
    use HasFactory;

    protected $table = 'orders';

    protected $guarded = [];

    protected $casts = [
        'total_cents' => 'integer',
        'status' => OrderStatus::class,
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function orderNumber(): string
    {
        return 'ORD-' . str_pad((string) $this->getKey(), 8, '0', STR_PAD_LEFT);
    }

    public function total(): string
    {
        return number_format($this->total_cents / 100, 2, '.', '') . ' ' . ($this->currency ?? 'USD');
    }

    public function status(): OrderStatus
    {
        return $this->status ?? OrderStatus::from(OrderStatus::PENDING);
    }

    public function isPending(): bool
    {
        return $this->status->isPending();
    }

    public function confirm(): void
    {
        $this->status = OrderStatus::CONFIRMED;
        $this->save();
    }

    public function ship(): void
    {
        $this->status = OrderStatus::SHIPPED;
        $this->save();
    }

    public function deliver(): void
    {
        $this->status = OrderStatus::DELIVERED;
        $this->save();
    }

    public function cancel(): void
    {
        $this->status = OrderStatus::CANCELLED;
        $this->save();
    }
}
