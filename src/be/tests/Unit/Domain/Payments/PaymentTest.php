<?php

declare(strict_types=1);

namespace Tests\Unit\Domain\Payments;

use DDD\Domain\Payments\Payment;
use DDD\Domain\Payments\ValueObjects\PaymentMethod;
use DDD\Domain\Payments\ValueObjects\PaymentStatus;
use PHPUnit\Framework\TestCase;

class PaymentTest extends TestCase
{
    public function test_payment_has_default_pending_status(): void
    {
        $payment = new Payment();
        $payment->order_id = 'order-1';
        $payment->amount_cents = 2500000;
        $payment->currency = 'USD';
        $payment->method = PaymentMethod::from(PaymentMethod::CREDIT_CARD);
        $payment->status = PaymentStatus::from(PaymentStatus::PENDING);

        $this->assertFalse($payment->isPaid());
        $this->assertSame(PaymentStatus::PENDING, (string) $payment->status);
    }

    public function test_payment_can_be_completed(): void
    {
        $payment = new Payment();
        $payment->status = PaymentStatus::from(PaymentStatus::PENDING);
        $payment->complete('txn_123');

        $this->assertTrue($payment->status->isPaid());
        $this->assertSame('txn_123', $payment->transactionReference());
    }

    public function test_payment_can_fail(): void
    {
        $payment = new Payment();
        $payment->status = PaymentStatus::from(PaymentStatus::PENDING);
        $payment->fail();

        $this->assertTrue($payment->status->isFailed());
    }

    public function test_payment_can_be_refunded(): void
    {
        $payment = new Payment();
        $payment->status = PaymentStatus::from(PaymentStatus::COMPLETED);
        $payment->refund();

        $this->assertTrue($payment->status->isRefunded());
    }

    public function test_payment_status_rejects_invalid_value(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        PaymentStatus::from('invalid_status');
    }

    public function test_payment_method_rejects_invalid_value(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        PaymentMethod::from('invalid_method');
    }
}
