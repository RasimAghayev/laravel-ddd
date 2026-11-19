<?php

declare(strict_types=1);

namespace DDD\Application\Payments\UseCases;

use DDD\Domain\Payments\Repository\PaymentRepositoryInterface;

class DeletePaymentUseCase
{
    public function __construct(
        private readonly PaymentRepositoryInterface $paymentRepository,
    ) {
    }

    public function execute(string $id): bool
    {
        $payment = $this->paymentRepository->findById($id);

        if ($payment === null) {
            return false;
        }

        $this->paymentRepository->delete($payment);

        return true;
    }
}
