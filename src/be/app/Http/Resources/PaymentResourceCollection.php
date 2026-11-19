<?php

declare(strict_types=1);

namespace DDD\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;

class PaymentResourceCollection extends ResourceCollection
{
    public function toArray(Request $request): array
    {
        return [
            'data' => PaymentResource::collection($this->collection)->toArray($request)['data'],
            'meta' => [
                'total' => $this->collection->count(),
            ],
        ];
    }
}
