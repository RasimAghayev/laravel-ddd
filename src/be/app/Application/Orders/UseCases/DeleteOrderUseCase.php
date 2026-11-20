<?php

declare(strict_types=1);

namespace DDD\Application\Orders\UseCases;

use DDD\Domain\Orders\Repository\OrderRepositoryInterface;

class DeleteOrderUseCase
{
    public function __construct(
        private readonly OrderRepositoryInterface $orderRepository,
    ) {}

    public function execute(string $id): bool
    {
        $order = $this->orderRepository->findById($id);

        if ($order === null) {
            return false;
        }

        $this->orderRepository->delete($order);

        return true;
    }
}
