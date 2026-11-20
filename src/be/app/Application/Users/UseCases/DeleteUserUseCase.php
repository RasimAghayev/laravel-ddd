<?php

declare(strict_types=1);

namespace DDD\Application\Users\UseCases;

use DDD\Domain\Users\Repository\UserRepositoryInterface;

class DeleteUserUseCase
{
    public function __construct(
        private readonly UserRepositoryInterface $userRepository,
    ) {}

    public function execute(string $id): bool
    {
        $user = $this->userRepository->findById($id);

        if ($user === null) {
            return false;
        }

        $this->userRepository->delete($user);

        return true;
    }
}
