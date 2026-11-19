<?php

declare(strict_types=1);

namespace DDD\Application\Payments\UseCases;

use DDD\Application\Payments\DTOs\PaymentData;
use DDD\Domain\Payments\Payment;
use DDD\Domain\Payments\Repository\PaymentRepositoryInterface;

class CreatePaymentUseCase
{
    public function __construct(
        private readonly PaymentRepositoryInterface $paymentRepository,
    ) {
    }

    public function execute(PaymentData $data): Payment
    {
        $payment = new Payment();
        $payment->order_id = $data->orderId;
        $payment->amount_cents = $data->amountCents;
        $payment->currency = $data->currency;
        $payment->method = $data->method;
        $payment->status = $data->status;
        $payment->transaction_reference = $data->transactionReference;

        $this->paymentRepository->save($payment);

        return $payment;
    }
}
