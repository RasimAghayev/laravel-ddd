<?php

declare(strict_types=1);

namespace DDD\Http\Resources;

use DDD\Domain\Orders\Order;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class OrderResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        /** @var Order $this->resource */
        $order = $this->resource;

        return [
            'id' => (string) $order->getKey(),
            'order_number' => $order->orderNumber(),
            'user_id' => $order->user_id,
            'total' => $order->total(),
            'total_cents' => $order->total_cents,
            'currency' => $order->currency,
            'status' => (string) $order->status,
            'is_pending' => $order->isPending(),
            'created_at' => $order->created_at?->toISOString(),
            'updated_at' => $order->updated_at?->toISOString(),
        ];
    }
}
