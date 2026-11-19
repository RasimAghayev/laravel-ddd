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
        'status' => ProductStatus::class,
        'is_active' => 'boolean',
    ];

    public function sku(): string
    {
        return 'PROD-' . str_pad((string) $this->getKey(), 8, '0', STR_PAD_LEFT);
    }

    public function price(): string
    {
        return number_format($this->price_cents / 100, 2, '.', '') . ' ' . ($this->currency ?? 'USD');
    }

    public function status(): ProductStatus
    {
        return $this->status ?? ProductStatus::from(ProductStatus::ACTIVE);
    }

    public function isActive(): bool
    {
        return $this->status->isActive();
    }

    public function activate(): void
    {
        $this->status = ProductStatus::ACTIVE;
        $this->save();
    }

    public function deactivate(): void
    {
        $this->status = ProductStatus::INACTIVE;
        $this->save();
    }

    public function archive(): void
    {
        $this->status = ProductStatus::ARCHIVED;
        $this->save();
    }
}
