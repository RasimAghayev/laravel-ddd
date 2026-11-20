<?php

declare(strict_types=1);

namespace DDD\Http\Controllers\API;

use DDD\Application\Users\DTOs\UserData;
use DDD\Application\Users\UseCases\CreateUserUseCase;
use DDD\Application\Users\UseCases\DeleteUserUseCase;
use DDD\Application\Users\UseCases\GetUserUseCase;
use DDD\Application\Users\UseCases\ListUsersUseCase;
use DDD\Application\Users\UseCases\UpdateUserUseCase;
use DDD\Domain\Shared\Criteria\Pagination;
use DDD\Http\Controllers\Controller;
use DDD\Http\Requests\StoreUserRequest;
use DDD\Http\Requests\UpdateUserRequest;
use DDD\Http\Resources\UserResource;
use DDD\Http\Resources\UserResourceCollection;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class UserController extends Controller
{
    public function __construct(
        private readonly ListUsersUseCase $listUsers,
        private readonly CreateUserUseCase $createUser,
        private readonly GetUserUseCase $getUser,
        private readonly UpdateUserUseCase $updateUser,
        private readonly DeleteUserUseCase $deleteUser,
    ) {}

    public function index(Request $request): UserResourceCollection
    {
        $page = (int) $request->query('page', 1);
        $perPage = (int) $request->query('per_page', 15);

        $users = $this->listUsers->execute(
            Pagination::create($page, $perPage)
        );

        return new UserResourceCollection($users);
    }

    public function store(StoreUserRequest $request, CreateUserUseCase $createUserUseCase): JsonResponse
    {
        $data = UserData::fromRequest($request->validated());

        $user = $createUserUseCase->execute($data);

        return response()->json(['data' => new UserResource($user)], Response::HTTP_CREATED);
    }

    public function show(string $id, GetUserUseCase $getUserUseCase): JsonResponse
    {
        $user = $getUserUseCase->execute($id);

        if ($user === null) {
            return response()->json(['message' => 'User not found'], Response::HTTP_NOT_FOUND);
        }

        return response()->json(['data' => new UserResource($user)]);
    }

    public function update(UpdateUserRequest $request, string $id, UpdateUserUseCase $updateUserUseCase): JsonResponse
    {
        $data = UserData::fromRequest(array_merge(['id' => $id], $request->validated()));

        $user = $updateUserUseCase->execute($id, $data);

        if ($user === null) {
            return response()->json(['message' => 'User not found'], Response::HTTP_NOT_FOUND);
        }

        return response()->json(['data' => new UserResource($user)]);
    }

    public function destroy(string $id, DeleteUserUseCase $deleteUserUseCase): JsonResponse
    {
        $deleted = $deleteUserUseCase->execute($id);

        if (! $deleted) {
            return response()->json(['message' => 'User not found'], Response::HTTP_NOT_FOUND);
        }

        return response()->json(null, Response::HTTP_NO_CONTENT);
    }
}
