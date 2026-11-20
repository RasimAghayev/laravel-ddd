<?php

declare(strict_types=1);

namespace DDD\Application\Payments\UseCases;

use DDD\Domain\Payments\Payment;
use DDD\Domain\Payments\Repository\PaymentRepositoryInterface;

class GetPaymentUseCase
{
    public function __construct(
        private readonly PaymentRepositoryInterface $paymentRepository,
    ) {}

    public function execute(string $id): ?Payment
    {
        return $this->paymentRepository->findById($id);
    }
}
