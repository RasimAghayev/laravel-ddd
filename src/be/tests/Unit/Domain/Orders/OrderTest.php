<?php

declare(strict_types=1);

namespace Tests\Unit\Domain\Orders;

use DDD\Domain\Orders\Order;
use DDD\Domain\Orders\ValueObjects\OrderStatus;
use PHPUnit\Framework\TestCase;

class OrderTest extends TestCase
{
    public function test_order_has_default_pending_status(): void
    {
        $order = new Order();
        $order->user_id = 'user-1';
        $order->total_cents = 2500000;
        $order->currency = 'USD';
        $order->status = OrderStatus::from(OrderStatus::PENDING);

        $this->assertTrue($order->isPending());
        $this->assertSame(OrderStatus::PENDING, (string) $order->status);
    }

    public function test_order_can_be_confirmed(): void
    {
        $order = new Order();
        $order->status = OrderStatus::from(OrderStatus::PENDING);
        $order->confirm();

        $this->assertTrue($order->status->isConfirmed());
        $this->assertFalse($order->isPending());
    }

    public function test_order_can_be_shipped(): void
    {
        $order = new Order();
        $order->status = OrderStatus::from(OrderStatus::CONFIRMED);
        $order->ship();

        $this->assertTrue($order->status->isShipped());
    }

    public function test_order_can_be_delivered(): void
    {
        $order = new Order();
        $order->status = OrderStatus::from(OrderStatus::SHIPPED);
        $order->deliver();

        $this->assertTrue($order->status->isDelivered());
    }

    public function test_order_can_be_cancelled(): void
    {
        $order = new Order();
        $order->status = OrderStatus::from(OrderStatus::PENDING);
        $order->cancel();

        $this->assertTrue($order->status->isCancelled());
    }

    public function test_order_status_rejects_invalid_value(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        OrderStatus::from('invalid_status');
    }
}
