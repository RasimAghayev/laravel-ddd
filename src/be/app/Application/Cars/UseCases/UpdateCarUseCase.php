<?php

declare(strict_types=1);

namespace DDD\Application\Cars\UseCases;

use DDD\Application\Cars\DTOs\CarData;
use DDD\Domain\Cars\Car;
use DDD\Domain\Cars\Repository\CarRepositoryInterface;

class UpdateCarUseCase
{
    public function __construct(
        private readonly CarRepositoryInterface $carRepository,
    ) {}

    public function execute(string $id, CarData $data): ?Car
    {
        $car = $this->carRepository->findById($id);

        if ($car === null) {
            return null;
        }

        if ($data->brand !== null) {
            $car->brand = $data->brand;
        }
        if ($data->model !== null) {
            $car->model = $data->model;
        }
        $car->year = $data->year;
        $car->price_cents = $data->price->cents;
        $car->currency = $data->price->currency;
        $car->status = (string) $data->status;

        $this->carRepository->save($car);

        return $car;
    }
}
