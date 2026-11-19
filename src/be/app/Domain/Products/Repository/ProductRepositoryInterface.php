<?php

declare(strict_types=1);

namespace DDD\Domain\Products\Repository;

use DDD\Domain\Products\Product;
use DDD\Domain\Shared\Criteria\Pagination;

interface ProductRepositoryInterface
{
    public function findById(string $id): ?Product;

    public function findAll(?Pagination $pagination = null): array;

    public function findActive(?Pagination $pagination = null): array;

    public function save(Product $product): void;

    public function delete(Product $product): void;

    public function count(): int;
}
