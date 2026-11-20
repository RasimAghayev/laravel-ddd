<?php

declare(strict_types=1);

namespace DDD\Application\Users\UseCases;

use DDD\Application\Users\DTOs\UserData;
use DDD\Domain\Users\Repository\UserRepositoryInterface;
use DDD\Domain\Users\User;
use Illuminate\Support\Facades\Hash;

class CreateUserUseCase
{
    public function __construct(
        private readonly UserRepositoryInterface $userRepository,
    ) {}

    public function execute(UserData $data): User
    {
        $user = new User;
        $user->name = $data->name;
        $user->email = (string) $data->email;
        $user->password = Hash::make($data->password);
        $user->role = (string) $data->role;

        $this->userRepository->save($user);

        return $user;
    }
}
