<?php

declare(strict_types=1);

namespace DDD\Application\Users\UseCases;

use DDD\Application\Users\DTOs\UserData;
use DDD\Domain\Users\Repository\UserRepositoryInterface;
use DDD\Domain\Users\User;
use Illuminate\Support\Facades\Hash;

class UpdateUserUseCase
{
    public function __construct(
        private readonly UserRepositoryInterface $userRepository,
    ) {}

    public function execute(string $id, UserData $data): ?User
    {
        $user = $this->userRepository->findById($id);

        if ($user === null) {
            return null;
        }

        $user->name = $data->name;
        $user->email = (string) $data->email;
        $user->role = $data->role;

        if ($data->password !== '') {
            $user->password = Hash::make($data->password);
        }

        $this->userRepository->save($user);

        return $user;
    }
}
