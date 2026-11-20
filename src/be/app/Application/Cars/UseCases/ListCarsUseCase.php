<?php

declare(strict_types=1);

namespace DDD\Application\Cars\UseCases;

use DDD\Domain\Cars\Repository\CarRepositoryInterface;
use DDD\Domain\Shared\Criteria\Pagination;

class ListCarsUseCase
{
    public function __construct(
        private readonly CarRepositoryInterface $carRepository,
    ) {}

    public function execute(?Pagination $pagination = null): array
    {
        return $this->carRepository->findAll($pagination);
    }
}
