<?php

declare(strict_types=1);

namespace DDD\Http\Controllers\API;

use DDD\Application\Payments\DTOs\PaymentData;
use DDD\Application\Payments\UseCases\CreatePaymentUseCase;
use DDD\Application\Payments\UseCases\DeletePaymentUseCase;
use DDD\Application\Payments\UseCases\GetPaymentUseCase;
use DDD\Application\Payments\UseCases\ListPaymentsUseCase;
use DDD\Application\Payments\UseCases\UpdatePaymentUseCase;
use DDD\Domain\Shared\Criteria\Pagination;
use DDD\Http\Controllers\Controller;
use DDD\Http\Requests\StorePaymentRequest;
use DDD\Http\Requests\UpdatePaymentRequest;
use DDD\Http\Resources\PaymentResource;
use DDD\Http\Resources\PaymentResourceCollection;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class PaymentController extends Controller
{
    public function __construct(
        private readonly ListPaymentsUseCase $listPayments,
        private readonly CreatePaymentUseCase $createPayment,
        private readonly GetPaymentUseCase $getPayment,
        private readonly UpdatePaymentUseCase $updatePayment,
        private readonly DeletePaymentUseCase $deletePayment,
    ) {}

    public function index(Request $request): PaymentResourceCollection
    {
        $page = (int) $request->query('page', 1);
        $perPage = (int) $request->query('per_page', 15);

        $payments = $this->listPayments->execute(
            Pagination::create($page, $perPage)
        );

        return new PaymentResourceCollection($payments);
    }

    public function store(StorePaymentRequest $request, CreatePaymentUseCase $createPaymentUseCase): JsonResponse
    {
        $data = PaymentData::fromRequest($request->validated());

        $payment = $createPaymentUseCase->execute($data);

        return response()->json(new PaymentResource($payment), Response::HTTP_CREATED);
    }

    public function show(string $id, GetPaymentUseCase $getPaymentUseCase): JsonResponse
    {
        $payment = $getPaymentUseCase->execute($id);

        if ($payment === null) {
            return response()->json(['message' => 'Payment not found'], Response::HTTP_NOT_FOUND);
        }

        return response()->json(new PaymentResource($payment));
    }

    public function update(UpdatePaymentRequest $request, string $id, UpdatePaymentUseCase $updatePaymentUseCase): JsonResponse
    {
        $data = PaymentData::fromRequest(array_merge(['id' => $id], $request->validated()));

        $payment = $updatePaymentUseCase->execute($id, $data);

        if ($payment === null) {
            return response()->json(['message' => 'Payment not found'], Response::HTTP_NOT_FOUND);
        }

        return response()->json(new PaymentResource($payment));
    }

    public function destroy(string $id, DeletePaymentUseCase $deletePaymentUseCase): JsonResponse
    {
        $deleted = $deletePaymentUseCase->execute($id);

        if (! $deleted) {
            return response()->json(['message' => 'Payment not found'], Response::HTTP_NOT_FOUND);
        }

        return response()->json(null, Response::HTTP_NO_CONTENT);
    }
}
