<?php

declare(strict_types=1);

namespace Tests\Unit\Domain\Invoices;

use DDD\Domain\Invoices\Invoice;
use DDD\Domain\Invoices\ValueObjects\InvoiceStatus;
use PHPUnit\Framework\TestCase;

class InvoiceTest extends TestCase
{
    public function test_invoice_has_default_draft_status(): void
    {
        $invoice = new Invoice;
        $invoice->order_id = 'order-1';
        $invoice->amount_cents = 2500000;
        $invoice->currency = 'USD';
        $invoice->status = InvoiceStatus::from(InvoiceStatus::DRAFT);

        $this->assertTrue($invoice->status->isDraft());
        $this->assertSame(InvoiceStatus::DRAFT, (string) $invoice->status);
    }

    public function test_invoice_can_be_issued(): void
    {
        $invoice = new Invoice;
        $invoice->status = InvoiceStatus::from(InvoiceStatus::DRAFT);
        $invoice->issue();

        $this->assertTrue($invoice->status->isIssued());
    }

    public function test_invoice_can_be_paid(): void
    {
        $invoice = new Invoice;
        $invoice->status = InvoiceStatus::from(InvoiceStatus::ISSUED);
        $invoice->pay();

        $this->assertTrue($invoice->status->isPaid());
    }

    public function test_invoice_can_be_voided(): void
    {
        $invoice = new Invoice;
        $invoice->status = InvoiceStatus::from(InvoiceStatus::ISSUED);
        $invoice->void();

        $this->assertTrue($invoice->status->isVoid());
    }

    public function test_invoice_status_rejects_invalid_value(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        InvoiceStatus::from('invalid_status');
    }
}
