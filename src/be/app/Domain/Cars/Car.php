<?php

namespace DDD\Domain\Cars;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Car extends Model
{
    /** @use HasFactory<\Database\Factories\DDD\Domain\Cars\CarFactory> */
    use HasFactory;
}
