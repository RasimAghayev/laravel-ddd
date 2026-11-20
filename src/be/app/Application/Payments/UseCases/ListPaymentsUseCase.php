<?php

declare(strict_types=1);

namespace DDD\Application\Payments\UseCases;

use DDD\Domain\Payments\Repository\PaymentRepositoryInterface;
use DDD\Domain\Shared\Criteria\Pagination;

class ListPaymentsUseCase
{
    public function __construct(
        private readonly PaymentRepositoryInterface $paymentRepository,
    ) {
    }

    public function execute(?Pagination $pagination = null): array
    {
        return $this->paymentRepository->findAll($pagination);
    }
}
