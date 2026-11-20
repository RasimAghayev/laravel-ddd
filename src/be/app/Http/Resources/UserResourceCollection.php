<?php

declare(strict_types=1);

namespace DDD\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;

class UserResourceCollection extends ResourceCollection
{
    public function toArray(Request $request): array
    {
        return [
            'data' => $this->collection->map(fn ($user) => (new UserResource($user))->toArray($request)),
            'meta' => [
                'total' => $this->collection->count(),
            ],
        ];
    }
}
