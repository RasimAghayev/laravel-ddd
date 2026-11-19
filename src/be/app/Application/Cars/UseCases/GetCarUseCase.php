<?php

declare(strict_types=1);

namespace DDD\Application\Cars\UseCases;

use DDD\Domain\Cars\Car;
use DDD\Domain\Cars\Repository\CarRepositoryInterface;

class GetCarUseCase
{
    public function __construct(
        private readonly CarRepositoryInterface $carRepository,
    ) {
    }

    public function execute(string $id): ?Car
    {
        return $this->carRepository->findById($id);
    }
}
