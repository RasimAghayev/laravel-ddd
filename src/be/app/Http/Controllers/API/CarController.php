<?php

declare(strict_types=1);

namespace DDD\Http\Controllers\API;

use DDD\Application\Cars\DTOs\CarData;
use DDD\Application\Cars\UseCases\CreateCarUseCase;
use DDD\Application\Cars\UseCases\DeleteCarUseCase;
use DDD\Application\Cars\UseCases\GetCarUseCase;
use DDD\Application\Cars\UseCases\ListCarsUseCase;
use DDD\Application\Cars\UseCases\UpdateCarUseCase;
use DDD\Domain\Shared\Criteria\Pagination;
use DDD\Http\Controllers\Controller;
use DDD\Http\Requests\StoreCarRequest;
use DDD\Http\Requests\UpdateCarRequest;
use DDD\Http\Resources\CarResource;
use DDD\Http\Resources\CarResourceCollection;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class CarController extends Controller
{
    public function __construct(
        private readonly ListCarsUseCase $listCars,
        private readonly CreateCarUseCase $createCar,
        private readonly GetCarUseCase $getCar,
        private readonly UpdateCarUseCase $updateCar,
        private readonly DeleteCarUseCase $deleteCar,
    ) {}

    public function index(Request $request): CarResourceCollection
    {
        $page = (int) $request->query('page', 1);
        $perPage = (int) $request->query('per_page', 15);

        $cars = $this->listCars->execute(
            Pagination::create($page, $perPage)
        );

        return new CarResourceCollection($cars);
    }

    public function store(StoreCarRequest $request, CreateCarUseCase $createCarUseCase): JsonResponse
    {
        $data = CarData::fromRequest($request->validated());

        $car = $createCarUseCase->execute($data);

        return response()->json(new CarResource($car), Response::HTTP_CREATED);
    }

    public function show(string $id, GetCarUseCase $getCarUseCase): JsonResponse
    {
        $car = $getCarUseCase->execute($id);

        if ($car === null) {
            return response()->json(['message' => 'Car not found'], Response::HTTP_NOT_FOUND);
        }

        return response()->json(new CarResource($car));
    }

    public function update(UpdateCarRequest $request, string $id, UpdateCarUseCase $updateCarUseCase): JsonResponse
    {
        $data = CarData::fromRequest(array_merge(['id' => $id], $request->validated()));

        $car = $updateCarUseCase->execute($id, $data);

        if ($car === null) {
            return response()->json(['message' => 'Car not found'], Response::HTTP_NOT_FOUND);
        }

        return response()->json(new CarResource($car));
    }

    public function destroy(string $id, DeleteCarUseCase $deleteCarUseCase): JsonResponse
    {
        $deleted = $deleteCarUseCase->execute($id);

        if (! $deleted) {
            return response()->json(['message' => 'Car not found'], Response::HTTP_NOT_FOUND);
        }

        return response()->json(null, Response::HTTP_NO_CONTENT);
    }
}
