<?php

declare(strict_types=1);

namespace DDD\Domain\Cars\Repository;

use DDD\Domain\Cars\Car;
use DDD\Domain\Shared\Criteria\Pagination;

interface CarRepositoryInterface
{
    public function findById(string $id): ?Car;

    public function findAll(?Pagination $pagination = null): array;

    public function save(Car $car): void;

    public function delete(Car $car): void;

    public function count(): int;
}
