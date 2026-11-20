<?php

declare(strict_types=1);

namespace DDD\Http\Controllers\API;

use DDD\Application\Notifications\DTOs\NotificationData;
use DDD\Application\Notifications\UseCases\CreateNotificationUseCase;
use DDD\Application\Notifications\UseCases\DeleteNotificationUseCase;
use DDD\Application\Notifications\UseCases\GetNotificationUseCase;
use DDD\Application\Notifications\UseCases\ListNotificationsUseCase;
use DDD\Application\Notifications\UseCases\UpdateNotificationUseCase;
use DDD\Domain\Shared\Criteria\Pagination;
use DDD\Http\Controllers\Controller;
use DDD\Http\Requests\StoreNotificationRequest;
use DDD\Http\Requests\UpdateNotificationRequest;
use DDD\Http\Resources\NotificationResource;
use DDD\Http\Resources\NotificationResourceCollection;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class NotificationController extends Controller
{
    public function __construct(
        private readonly ListNotificationsUseCase $listNotifications,
        private readonly CreateNotificationUseCase $createNotification,
        private readonly GetNotificationUseCase $getNotification,
        private readonly UpdateNotificationUseCase $updateNotification,
        private readonly DeleteNotificationUseCase $deleteNotification,
    ) {}

    public function index(Request $request): NotificationResourceCollection
    {
        $page = (int) $request->query('page', 1);
        $perPage = (int) $request->query('per_page', 15);

        $notifications = $this->listNotifications->execute(
            Pagination::create($page, $perPage)
        );

        return new NotificationResourceCollection($notifications);
    }

    public function store(StoreNotificationRequest $request, CreateNotificationUseCase $createNotificationUseCase): JsonResponse
    {
        $data = NotificationData::fromRequest($request->validated());

        $notification = $createNotificationUseCase->execute($data);

        return response()->json(new NotificationResource($notification), Response::HTTP_CREATED);
    }

    public function show(string $id, GetNotificationUseCase $getNotificationUseCase): JsonResponse
    {
        $notification = $getNotificationUseCase->execute($id);

        if ($notification === null) {
            return response()->json(['message' => 'Notification not found'], Response::HTTP_NOT_FOUND);
        }

        return response()->json(new NotificationResource($notification));
    }

    public function update(UpdateNotificationRequest $request, string $id, UpdateNotificationUseCase $updateNotificationUseCase): JsonResponse
    {
        $data = NotificationData::fromRequest(array_merge(['id' => $id], $request->validated()));

        $notification = $updateNotificationUseCase->execute($id, $data);

        if ($notification === null) {
            return response()->json(['message' => 'Notification not found'], Response::HTTP_NOT_FOUND);
        }

        return response()->json(new NotificationResource($notification));
    }

    public function destroy(string $id, DeleteNotificationUseCase $deleteNotificationUseCase): JsonResponse
    {
        $deleted = $deleteNotificationUseCase->execute($id);

        if (! $deleted) {
            return response()->json(['message' => 'Notification not found'], Response::HTTP_NOT_FOUND);
        }

        return response()->json(null, Response::HTTP_NO_CONTENT);
    }
}
