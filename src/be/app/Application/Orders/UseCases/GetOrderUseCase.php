<?php

declare(strict_types=1);

namespace DDD\Application\Orders\UseCases;

use DDD\Domain\Orders\Order;
use DDD\Domain\Orders\Repository\OrderRepositoryInterface;

class GetOrderUseCase
{
    public function __construct(
        private readonly OrderRepositoryInterface $orderRepository,
    ) {
    }

    public function execute(string $id): ?Order
    {
        return $this->orderRepository->findById($id);
    }
}
