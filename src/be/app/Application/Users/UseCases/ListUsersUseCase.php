<?php

declare(strict_types=1);

namespace DDD\Application\Users\UseCases;

use DDD\Domain\Shared\Criteria\Pagination;
use DDD\Domain\Users\Repository\UserRepositoryInterface;

class ListUsersUseCase
{
    public function __construct(
        private readonly UserRepositoryInterface $userRepository,
    ) {
    }

    public function execute(?Pagination $pagination = null): array
    {
        return $this->userRepository->findAll($pagination);
    }
}
