<?php

declare(strict_types=1);

namespace DDD\Domain\Products;

use DDD\Domain\Products\ValueObjects\ProductStatus;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $table = 'products';

    protected $guarded = [];

    protected $casts = [
        'price_cents' => 'integer',
        'is_active' => 'boolean',
    ];

    public function sku(): string
    {
        return 'PROD-'.str_pad((string) $this->getKey(), 8, '0', STR_PAD_LEFT);
    }

    public function price(): string
    {
        return number_format($this->price_cents / 100, 2, '.', '').' '.($this->currency ?? 'USD');
    }

    public function isActive(): bool
    {
        $status = $this->getAttribute('status');

        if ($status instanceof ProductStatus) {
            return $status->isActive();
        }

        return ProductStatus::from($status ?? ProductStatus::ACTIVE)->isActive();
    }

    public function activate(): void
    {
        $this->status = ProductStatus::from(ProductStatus::ACTIVE);
    }

    public function deactivate(): void
    {
        $this->status = ProductStatus::from(ProductStatus::INACTIVE);
    }

    public function archive(): void
    {
        $this->status = ProductStatus::from(ProductStatus::ARCHIVED);
    }
}
