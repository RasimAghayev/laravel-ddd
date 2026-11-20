<?php

declare(strict_types=1);

namespace DDD\Infrastructure\Persistence\Eloquent\Cars;

use DDD\Domain\Cars\Car;
use DDD\Domain\Cars\Repository\CarRepositoryInterface;
use DDD\Domain\Shared\Criteria\Pagination;

class EloquentCarRepository implements CarRepositoryInterface
{
    public function findById(string $id): ?Car
    {
        return Car::find($id);
    }

    public function findAll(?Pagination $pagination = null): array
    {
        $query = Car::query();

        if ($pagination !== null) {
            $query->offset($pagination->offset())->limit($pagination->perPage);
        }

        return $query->get()->all();
    }

    public function save(Car $car): void
    {
        $car->save();
    }

    public function delete(Car $car): void
    {
        $car->delete();
    }

    public function count(): int
    {
        return Car::count();
    }
}
