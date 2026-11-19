<?php

declare(strict_types=1);

namespace DDD\Domain\Users\Repository;

use DDD\Domain\Shared\Criteria\Pagination;
use DDD\Domain\Users\User;

interface UserRepositoryInterface
{
    public function findById(string $id): ?User;

    public function findByEmail(string $email): ?User;

    public function findAll(?Pagination $pagination = null): array;

    public function save(User $user): void;

    public function delete(User $user): void;

    public function count(): int;
}
