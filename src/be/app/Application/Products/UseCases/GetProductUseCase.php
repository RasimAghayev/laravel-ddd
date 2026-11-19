<?php

declare(strict_types=1);

namespace DDD\Application\Products\UseCases;

use DDD\Domain\Products\Product;
use DDD\Domain\Products\Repository\ProductRepositoryInterface;

class GetProductUseCase
{
    public function __construct(
        private readonly ProductRepositoryInterface $productRepository,
    ) {
    }

    public function execute(string $id): ?Product
    {
        return $this->productRepository->findById($id);
    }
}
