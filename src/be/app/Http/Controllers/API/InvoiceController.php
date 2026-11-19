<?php

declare(strict_types=1);

namespace DDD\Http\Controllers\API;

use DDD\Application\Invoices\DTOs\InvoiceData;
use DDD\Application\Invoices\UseCases\CreateInvoiceUseCase;
use DDD\Application\Invoices\UseCases\DeleteInvoiceUseCase;
use DDD\Application\Invoices\UseCases\GetInvoiceUseCase;
use DDD\Application\Invoices\UseCases\ListInvoicesUseCase;
use DDD\Application\Invoices\UseCases\UpdateInvoiceUseCase;
use DDD\Http\Controllers\Controller;
use DDD\Http\Requests\StoreInvoiceRequest;
use DDD\Http\Requests\UpdateInvoiceRequest;
use DDD\Http\Resources\InvoiceResource;
use DDD\Http\Resources\InvoiceResourceCollection;
use DDD\Domain\Shared\Criteria\Pagination;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class InvoiceController extends Controller
{
    public function __construct(
        private readonly ListInvoicesUseCase $listInvoices,
        private readonly CreateInvoiceUseCase $createInvoice,
        private readonly GetInvoiceUseCase $getInvoice,
        private readonly UpdateInvoiceUseCase $updateInvoice,
        private readonly DeleteInvoiceUseCase $deleteInvoice,
    ) {
    }

    public function index(Request $request): InvoiceResourceCollection
    {
        $page = (int) $request->query('page', 1);
        $perPage = (int) $request->query('per_page', 15);

        $invoices = $this->listInvoices->execute(
            Pagination::create($page, $perPage)
        );

        return new InvoiceResourceCollection($invoices);
    }

    public function store(StoreInvoiceRequest $request, CreateInvoiceUseCase $createInvoiceUseCase): JsonResponse
    {
        $data = InvoiceData::fromRequest($request->validated());

        $invoice = $createInvoiceUseCase->execute($data);

        return response()->json(new InvoiceResource($invoice), Response::HTTP_CREATED);
    }

    public function show(string $id, GetInvoiceUseCase $getInvoiceUseCase): JsonResponse
    {
        $invoice = $getInvoiceUseCase->execute($id);

        if ($invoice === null) {
            return response()->json(['message' => 'Invoice not found'], Response::HTTP_NOT_FOUND);
        }

        return response()->json(new InvoiceResource($invoice));
    }

    public function update(UpdateInvoiceRequest $request, string $id, UpdateInvoiceUseCase $updateInvoiceUseCase): JsonResponse
    {
        $data = InvoiceData::fromRequest(array_merge(['id' => $id], $request->validated()));

        $invoice = $updateInvoiceUseCase->execute($id, $data);

        if ($invoice === null) {
            return response()->json(['message' => 'Invoice not found'], Response::HTTP_NOT_FOUND);
        }

        return response()->json(new InvoiceResource($invoice));
    }

    public function destroy(string $id, DeleteInvoiceUseCase $deleteInvoiceUseCase): JsonResponse
    {
        $deleted = $deleteInvoiceUseCase->execute($id);

        if (! $deleted) {
            return response()->json(['message' => 'Invoice not found'], Response::HTTP_NOT_FOUND);
        }

        return response()->json(null, Response::HTTP_NO_CONTENT);
    }
}
