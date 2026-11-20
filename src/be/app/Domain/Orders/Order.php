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
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function orderNumber(): string
    {
        return 'ORD-'.str_pad((string) $this->getKey(), 8, '0', STR_PAD_LEFT);
    }

    public function total(): string
    {
        return number_format($this->total_cents / 100, 2, '.', '').' '.($this->currency ?? 'USD');
    }

    public function isPending(): bool
    {
        $status = $this->getAttribute('status');

        if ($status instanceof OrderStatus) {
            return $status->isPending();
        }

        return OrderStatus::from($status ?? OrderStatus::PENDING)->isPending();
    }

    public function confirm(): void
    {
        $this->status = OrderStatus::from(OrderStatus::CONFIRMED);
    }

    public function ship(): void
    {
        $this->status = OrderStatus::from(OrderStatus::SHIPPED);
    }

    public function deliver(): void
    {
        $this->status = OrderStatus::from(OrderStatus::DELIVERED);
    }

    public function cancel(): void
    {
        $this->status = OrderStatus::from(OrderStatus::CANCELLED);
    }
}
