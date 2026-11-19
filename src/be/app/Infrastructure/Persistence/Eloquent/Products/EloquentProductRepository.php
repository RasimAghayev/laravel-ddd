<?php

declare(strict_types=1);

namespace DDD\Infrastructure\Persistence\Eloquent\Products;

use DDD\Domain\Products\Product;
use DDD\Domain\Products\Repository\ProductRepositoryInterface;
use DDD\Domain\Shared\Criteria\Pagination;

class EloquentProductRepository implements ProductRepositoryInterface
{
    public function findById(string $id): ?Product
    {
        return Product::find($id);
    }

    public function findAll(?Pagination $pagination = null): array
    {
        $query = Product::query();

        if ($pagination !== null) {
            $query->offset($pagination->offset())->limit($pagination->perPage);
        }

        return $query->get()->all();
    }

    public function findActive(?Pagination $pagination = null): array
    {
        $query = Product::where('status', 'active');

        if ($pagination !== null) {
            $query->offset($pagination->offset())->limit($pagination->perPage);
        }

        return $query->get()->all();
    }

    public function save(Product $product): void
    {
        $product->save();
    }

    public function delete(Product $product): void
    {
        $product->delete();
    }

    public function count(): int
    {
        return Product::count();
    }
}
