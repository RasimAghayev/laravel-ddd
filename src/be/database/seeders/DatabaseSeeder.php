<?php

declare(strict_types=1);

namespace Database\Seeders;

use DDD\Domain\Cars\Car;
use DDD\Domain\Users\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        User::factory(5)->create();

        Car::factory(10)->create();
    }
}
