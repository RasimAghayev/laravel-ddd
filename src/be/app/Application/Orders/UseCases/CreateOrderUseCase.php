<?php

declare(strict_types=1);

namespace DDD\Application\Orders\UseCases;

use DDD\Application\Orders\DTOs\OrderData;
use DDD\Domain\Orders\Order;
use DDD\Domain\Orders\Repository\OrderRepositoryInterface;

class CreateOrderUseCase
{
    public function __construct(
        private readonly OrderRepositoryInterface $orderRepository,
    ) {}

    public function execute(OrderData $data): Order
    {
        $order = new Order;
        $order->user_id = $data->userId ?? '';
        $order->total_cents = $data->totalCents;
        $order->currency = $data->currency;
        $order->status = (string) $data->status;

        $this->orderRepository->save($order);

        return $order;
    }
}
