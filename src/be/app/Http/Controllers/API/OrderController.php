<?php

declare(strict_types=1);

namespace DDD\Http\Controllers\API;

use DDD\Application\Orders\DTOs\OrderData;
use DDD\Application\Orders\UseCases\CreateOrderUseCase;
use DDD\Application\Orders\UseCases\DeleteOrderUseCase;
use DDD\Application\Orders\UseCases\GetOrderUseCase;
use DDD\Application\Orders\UseCases\ListOrdersUseCase;
use DDD\Application\Orders\UseCases\UpdateOrderUseCase;
use DDD\Domain\Shared\Criteria\Pagination;
use DDD\Http\Controllers\Controller;
use DDD\Http\Requests\StoreOrderRequest;
use DDD\Http\Requests\UpdateOrderRequest;
use DDD\Http\Resources\OrderResource;
use DDD\Http\Resources\OrderResourceCollection;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class OrderController extends Controller
{
    public function __construct(
        private readonly ListOrdersUseCase $listOrders,
        private readonly CreateOrderUseCase $createOrder,
        private readonly GetOrderUseCase $getOrder,
        private readonly UpdateOrderUseCase $updateOrder,
        private readonly DeleteOrderUseCase $deleteOrder,
    ) {}

    public function index(Request $request): OrderResourceCollection
    {
        $page = (int) $request->query('page', 1);
        $perPage = (int) $request->query('per_page', 15);

        $orders = $this->listOrders->execute(
            Pagination::create($page, $perPage)
        );

        return new OrderResourceCollection($orders);
    }

    public function store(StoreOrderRequest $request, CreateOrderUseCase $createOrderUseCase): JsonResponse
    {
        $data = OrderData::fromRequest($request->validated());

        $order = $createOrderUseCase->execute($data);

        return response()->json(['data' => new OrderResource($order)], Response::HTTP_CREATED);
    }

    public function show(string $id, GetOrderUseCase $getOrderUseCase): JsonResponse
    {
        $order = $getOrderUseCase->execute($id);

        if ($order === null) {
            return response()->json(['message' => 'Order not found'], Response::HTTP_NOT_FOUND);
        }

        return response()->json(['data' => new OrderResource($order)]);
    }

    public function update(UpdateOrderRequest $request, string $id, UpdateOrderUseCase $updateOrderUseCase): JsonResponse
    {
        $data = OrderData::fromRequest(array_merge(['id' => $id], $request->validated()));

        $order = $updateOrderUseCase->execute($id, $data);

        if ($order === null) {
            return response()->json(['message' => 'Order not found'], Response::HTTP_NOT_FOUND);
        }

        return response()->json(['data' => new OrderResource($order)]);
    }

    public function destroy(string $id, DeleteOrderUseCase $deleteOrderUseCase): JsonResponse
    {
        $deleted = $deleteOrderUseCase->execute($id);

        if (! $deleted) {
            return response()->json(['message' => 'Order not found'], Response::HTTP_NOT_FOUND);
        }

        return response()->json(null, Response::HTTP_NO_CONTENT);
    }
}
