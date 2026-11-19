<?php

declare(strict_types=1);

namespace DDD\Application\Products\UseCases;

use DDD\Domain\Products\Repository\ProductRepositoryInterface;

class DeleteProductUseCase
{
    public function __construct(
        private readonly ProductRepositoryInterface $productRepository,
    ) {
    }

    public function execute(string $id): bool
    {
        $product = $this->productRepository->findById($id);

        if ($product === null) {
            return false;
        }

        $this->productRepository->delete($product);

        return true;
    }
}
