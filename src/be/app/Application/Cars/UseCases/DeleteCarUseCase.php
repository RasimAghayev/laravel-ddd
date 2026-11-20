<?php

declare(strict_types=1);

namespace DDD\Application\Cars\UseCases;

use DDD\Domain\Cars\Repository\CarRepositoryInterface;

class DeleteCarUseCase
{
    public function __construct(
        private readonly CarRepositoryInterface $carRepository,
    ) {}

    public function execute(string $id): bool
    {
        $car = $this->carRepository->findById($id);

        if ($car === null) {
            return false;
        }

        $this->carRepository->delete($car);

        return true;
    }
}
