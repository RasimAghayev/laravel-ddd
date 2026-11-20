<?php

declare(strict_types=1);

namespace DDD\Application\Users\UseCases;

use DDD\Domain\Users\Repository\UserRepositoryInterface;
use DDD\Domain\Users\User;

class GetUserUseCase
{
    public function __construct(
        private readonly UserRepositoryInterface $userRepository,
    ) {}

    public function execute(string $id): ?User
    {
        return $this->userRepository->findById($id);
    }

    public function byEmail(string $email): ?User
    {
        return $this->userRepository->findByEmail($email);
    }
}
