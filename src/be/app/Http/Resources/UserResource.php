<?php

declare(strict_types=1);

namespace DDD\Http\Resources;

use DDD\Domain\Users\User;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        /** @var User $this->resource */
        $user = $this->resource;

        return [
            'id' => (string) $user->getKey(),
            'name' => $user->name,
            'email' => (string) $user->email(),
            'role' => (string) $user->role,
            'is_admin' => $user->isAdmin(),
            'email_verified_at' => $user->email_verified_at?->toISOString(),
            'created_at' => $user->created_at?->toISOString(),
            'updated_at' => $user->updated_at?->toISOString(),
        ];
    }
}
