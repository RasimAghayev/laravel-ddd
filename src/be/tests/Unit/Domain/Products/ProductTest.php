<?php

declare(strict_types=1);

namespace Tests\Unit\Domain\Products;

use DDD\Domain\Products\Product;
use DDD\Domain\Products\ValueObjects\ProductStatus;
use PHPUnit\Framework\TestCase;

class ProductTest extends TestCase
{
    public function test_product_has_default_active_status(): void
    {
        $product = new Product();
        $product->name = 'Test Product';
        $product->sku = 'TEST-001';
        $product->price_cents = 99900;
        $product->currency = 'USD';
        $product->status = ProductStatus::from(ProductStatus::ACTIVE);
        $product->stock_quantity = 10;

        $this->assertTrue($product->isActive());
        $this->assertSame(ProductStatus::ACTIVE, (string) $product->status);
    }

    public function test_product_can_be_deactivated(): void
    {
        $product = new Product();
        $product->status = ProductStatus::from(ProductStatus::ACTIVE);
        $product->deactivate();

        $this->assertTrue($product->status->isInactive());
        $this->assertFalse($product->isActive());
    }

    public function test_product_can_be_archived(): void
    {
        $product = new Product();
        $product->status = ProductStatus::from(ProductStatus::ACTIVE);
        $product->archive();

        $this->assertTrue($product->status->isArchived());
    }

    public function test_product_status_rejects_invalid_value(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        ProductStatus::from('invalid_status');
    }
}
