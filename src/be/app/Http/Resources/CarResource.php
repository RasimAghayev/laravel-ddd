<?php

declare(strict_types=1);

namespace DDD\Http\Resources;

use DDD\Domain\Cars\Car;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class CarResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        /** @var Car $this->resource */
        $car = $this->resource;

        return [
            'id' => (string) $car->getKey(),
            'brand' => $car->brand,
            'model' => $car->model,
            'year' => $car->year,
            'price' => $car->price()->toDecimal(),
            'price_cents' => $car->price_cents,
            'currency' => $car->currency,
            'status' => (string) $car->status,
            'is_active' => $car->isActive(),
            'created_at' => $car->created_at?->toISOString(),
            'updated_at' => $car->updated_at?->toISOString(),
        ];
    }
}
