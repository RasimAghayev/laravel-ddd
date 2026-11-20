<?php

declare(strict_types=1);

namespace DDD\Http\Controllers\API;

use DDD\Application\Products\DTOs\ProductData;
use DDD\Application\Products\UseCases\CreateProductUseCase;
use DDD\Application\Products\UseCases\DeleteProductUseCase;
use DDD\Application\Products\UseCases\GetProductUseCase;
use DDD\Application\Products\UseCases\ListProductsUseCase;
use DDD\Application\Products\UseCases\UpdateProductUseCase;
use DDD\Domain\Shared\Criteria\Pagination;
use DDD\Http\Controllers\Controller;
use DDD\Http\Requests\StoreProductRequest;
use DDD\Http\Requests\UpdateProductRequest;
use DDD\Http\Resources\ProductResource;
use DDD\Http\Resources\ProductResourceCollection;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class ProductController extends Controller
{
    public function __construct(
        private readonly ListProductsUseCase $listProducts,
        private readonly CreateProductUseCase $createProduct,
        private readonly GetProductUseCase $getProduct,
        private readonly UpdateProductUseCase $updateProduct,
        private readonly DeleteProductUseCase $deleteProduct,
    ) {}

    public function index(Request $request): ProductResourceCollection
    {
        $page = (int) $request->query('page', 1);
        $perPage = (int) $request->query('per_page', 15);

        $products = $this->listProducts->execute(
            Pagination::create($page, $perPage)
        );

        return new ProductResourceCollection($products);
    }

    public function store(StoreProductRequest $request, CreateProductUseCase $createProductUseCase): JsonResponse
    {
        $data = ProductData::fromRequest($request->validated());

        $product = $createProductUseCase->execute($data);

        return response()->json(['data' => new ProductResource($product)], Response::HTTP_CREATED);
    }

    public function show(string $id, GetProductUseCase $getProductUseCase): JsonResponse
    {
        $product = $getProductUseCase->execute($id);

        if ($product === null) {
            return response()->json(['message' => 'Product not found'], Response::HTTP_NOT_FOUND);
        }

        return response()->json(['data' => new ProductResource($product)]);
    }

    public function update(UpdateProductRequest $request, string $id, UpdateProductUseCase $updateProductUseCase): JsonResponse
    {
        $data = ProductData::fromRequest(array_merge(['id' => $id], $request->validated()));

        $product = $updateProductUseCase->execute($id, $data);

        if ($product === null) {
            return response()->json(['message' => 'Product not found'], Response::HTTP_NOT_FOUND);
        }

        return response()->json(['data' => new ProductResource($product)]);
    }

    public function destroy(string $id, DeleteProductUseCase $deleteProductUseCase): JsonResponse
    {
        $deleted = $deleteProductUseCase->execute($id);

        if (! $deleted) {
            return response()->json(['message' => 'Product not found'], Response::HTTP_NOT_FOUND);
        }

        return response()->json(null, Response::HTTP_NO_CONTENT);
    }
}
