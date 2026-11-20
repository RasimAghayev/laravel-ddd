<?php

declare(strict_types=1);

namespace DDD\Infrastructure\Persistence\Eloquent\Users;

use DDD\Domain\Shared\Criteria\Pagination;
use DDD\Domain\Users\Repository\UserRepositoryInterface;
use DDD\Domain\Users\User;

class EloquentUserRepository implements UserRepositoryInterface
{
    public function findById(string $id): ?User
    {
        return User::find($id);
    }

    public function findByEmail(string $email): ?User
    {
        return User::where('email', $email)->first();
    }

    public function findAll(?Pagination $pagination = null): array
    {
        $query = User::query();

        if ($pagination !== null) {
            $query->offset($pagination->offset())->limit($pagination->perPage);
        }

        return $query->get()->all();
    }

    public function save(User $user): void
    {
        $user->save();
    }

    public function delete(User $user): void
    {
        $user->delete();
    }

    public function count(): int
    {
        return User::count();
    }
}
