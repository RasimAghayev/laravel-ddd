<?php

declare(strict_types=1);

namespace DDD\Domain\Shared\Criteria;

final class Pagination
{
    private function __construct(
        public readonly int $page,
        public readonly int $perPage,
    ) {
        if ($page < 1) {
            throw new \InvalidArgumentException('Page must be >= 1');
        }
        if ($perPage < 1 || $perPage > 100) {
            throw new \InvalidArgumentException('PerPage must be between 1 and 100');
        }
    }

    public static function create(int $page = 1, int $perPage = 15): self
    {
        return new self($page, $perPage);
    }

    public function offset(): int
    {
        return ($this->page - 1) * $this->perPage;
    }
}
