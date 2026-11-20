<?php

declare(strict_types=1);

namespace DDD\Application\Products\UseCases;

use DDD\Application\Products\DTOs\ProductData;
use DDD\Domain\Products\Product;
use DDD\Domain\Products\Repository\ProductRepositoryInterface;

class UpdateProductUseCase
{
    public function __construct(
        private readonly ProductRepositoryInterface $productRepository,
    ) {}

    public function execute(string $id, ProductData $data): ?Product
    {
        $product = $this->productRepository->findById($id);

        if ($product === null) {
            return null;
        }

        $product->name = $data->name;
        $product->sku = $data->sku;
        $product->description = $data->description;
        $product->price_cents = $data->priceCents;
        $product->currency = $data->currency;
        $product->status = $data->status;
        $product->stock_quantity = $data->stockQuantity;

        $this->productRepository->save($product);

        return $product;
    }
}
