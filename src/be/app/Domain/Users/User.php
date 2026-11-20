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
    ];

    public function email(): Email
    {
        return Email::from($this->email);
    }

    public function userRole(): UserRole
    {
        if ($this->role instanceof UserRole) {
            return $this->role;
        }

        return UserRole::from($this->role ?? UserRole::USER);
    }

    public function getRoleAttribute($value)
    {
        if ($value instanceof UserRole) {
            return (string) $value;
        }

        return (string) ($value ?? UserRole::USER);
    }

    public function isAdmin(): bool
    {
        return $this->userRole()->isAdmin();
    }

    public function promoteToAdmin(): void
    {
        $this->role = UserRole::from(UserRole::ADMIN);
    }

    public function demoteToUser(): void
    {
        $this->role = UserRole::from(UserRole::USER);
    }
}
