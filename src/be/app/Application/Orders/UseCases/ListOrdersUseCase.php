<?php

declare(strict_types=1);

namespace DDD\Application\Orders\UseCases;

use DDD\Domain\Orders\Repository\OrderRepositoryInterface;
use DDD\Domain\Shared\Criteria\Pagination;

class ListOrdersUseCase
{
    public function __construct(
        private readonly OrderRepositoryInterface $orderRepository,
    ) {
    }

    public function execute(?Pagination $pagination = null): array
    {
        return $this->orderRepository->findAll($pagination);
    }
}
