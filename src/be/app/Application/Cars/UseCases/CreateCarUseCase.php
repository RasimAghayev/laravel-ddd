<?php

declare(strict_types=1);

namespace DDD\Application\Cars\UseCases;

use DDD\Application\Cars\DTOs\CarData;
use DDD\Domain\Cars\Car;
use DDD\Domain\Cars\Repository\CarRepositoryInterface;

class CreateCarUseCase
{
    public function __construct(
        private readonly CarRepositoryInterface $carRepository,
    ) {
    }

    public function execute(CarData $data): Car
    {
        $car = new Car();
        $car->brand = $data->brand;
        $car->model = $data->model;
        $car->year = $data->year;
        $car->price_cents = $data->price->cents;
        $car->currency = $data->price->currency;
        $car->status = $data->status;

        $this->carRepository->save($car);

        return $car;
    }
}
