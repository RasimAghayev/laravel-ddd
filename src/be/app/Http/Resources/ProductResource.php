<?php

declare(strict_types=1);

namespace DDD\Http\Resources;

use DDD\Domain\Products\Product;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        /** @var Product $this->resource */
        $product = $this->resource;

        return [
            'id' => (string) $product->getKey(),
            'sku' => $product->sku,
            'name' => $product->name,
            'description' => $product->description,
            'price' => $product->price(),
            'price_cents' => $product->price_cents,
            'currency' => $product->currency,
            'status' => (string) $product->status,
            'is_active' => $product->isActive(),
            'stock_quantity' => $product->stock_quantity,
            'created_at' => $product->created_at?->toISOString(),
            'updated_at' => $product->updated_at?->toISOString(),
        ];
    }
}
