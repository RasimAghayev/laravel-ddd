<?php

declare(strict_types=1);

namespace DDD\Application\Users\DTOs;

use DDD\Domain\Users\ValueObjects\Email;
use DDD\Domain\Users\ValueObjects\UserRole;

final class UserData
{
    public function __construct(
        public readonly ?string $id,
        public readonly string $name,
        public readonly Email $email,
        public readonly string $password,
        public readonly UserRole $role,
    ) {}

    public static function fromRequest(array $data): self
    {
        return new self(
            id: $data['id'] ?? null,
            name: $data['name'],
            email: Email::from($data['email']),
            password: $data['password'] ?? '',
            role: UserRole::from($data['role'] ?? UserRole::USER),
        );
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'email' => (string) $this->email,
            'password' => $this->password,
            'role' => (string) $this->role,
        ];
    }
}
