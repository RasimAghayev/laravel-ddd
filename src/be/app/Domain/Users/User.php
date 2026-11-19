<?php

declare(strict_types=1);

namespace DDD\Domain\Users;

use DDD\Domain\Users\ValueObjects\Email;
use DDD\Domain\Users\ValueObjects\UserRole;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use HasFactory, Notifiable;

    protected $table = 'users';

    protected $fillable = [
        'name',
        'email',
        'password',
        'role',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
        'role' => UserRole::class,
    ];

    public function email(): Email
    {
        return Email::from($this->email);
    }

    public function role(): UserRole
    {
        return $this->role ?? UserRole::from(UserRole::USER);
    }

    public function isAdmin(): bool
    {
        return $this->role->isAdmin();
    }

    public function promoteToAdmin(): void
    {
        $this->role = UserRole::ADMIN;
        $this->save();
    }

    public function demoteToUser(): void
    {
        $this->role = UserRole::USER;
        $this->save();
    }
}
