<?php

declare(strict_types=1);

namespace DDD\Application\Products\UseCases;

use DDD\Domain\Products\Repository\ProductRepositoryInterface;
use DDD\Domain\Shared\Criteria\Pagination;

class ListProductsUseCase
{
    public function __construct(
        private readonly ProductRepositoryInterface $productRepository,
    ) {}

    public function execute(?Pagination $pagination = null): array
    {
        return $this->productRepository->findAll($pagination);
    }
}
