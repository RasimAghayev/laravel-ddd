<?php

declare(strict_types=1);

namespace DDD\Domain\Cars;

use DDD\Domain\Cars\ValueObjects\CarStatus;
use DDD\Domain\Cars\ValueObjects\Price;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Car extends Model
{
    use HasFactory;

    protected $table = 'cars';

    protected $guarded = [];

    protected $casts = [
        'price_cents' => 'integer',
        'status' => CarStatus::class,
        'is_active' => 'boolean',
    ];

    public function brand(): string
    {
        return $this->brand;
    }

    public function model(): string
    {
        return $this->model;
    }

    public function year(): int
    {
        return (int) $this->year;
    }

    public function price(): Price
    {
        return Price::fromCents((int) $this->price_cents, $this->currency ?? 'USD');
    }

    public function status(): CarStatus
    {
        return $this->status ?? CarStatus::from(CarStatus::ACTIVE);
    }

    public function isActive(): bool
    {
        return $this->status->isActive();
    }

    public function activate(): void
    {
        $this->status = CarStatus::ACTIVE;
        $this->save();
    }

    public function sell(): void
    {
        $this->status = CarStatus::SOLD;
        $this->save();
    }

    public function reserve(): void
    {
        $this->status = CarStatus::RESERVED;
        $this->save();
    }

    public function maintenance(): void
    {
        $this->status = CarStatus::MAINTENANCE;
        $this->save();
    }
}
