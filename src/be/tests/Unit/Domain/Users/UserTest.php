<?php

declare(strict_types=1);

namespace Tests\Unit\Domain\Users;

use DDD\Domain\Users\User;
use DDD\Domain\Users\ValueObjects\Email;
use DDD\Domain\Users\ValueObjects\UserRole;
use PHPUnit\Framework\TestCase;

class UserTest extends TestCase
{
    public function test_user_has_default_user_role(): void
    {
        $user = new User;
        $user->name = 'John';
        $user->email = 'john@example.com';

        $this->assertSame(UserRole::USER, (string) $user->role);
        $this->assertFalse($user->isAdmin());
    }

    public function test_user_can_be_promoted_to_admin(): void
    {
        $user = new User;
        $user->promoteToAdmin();

        $this->assertTrue($user->isAdmin());
        $this->assertSame(UserRole::ADMIN, (string) $user->role);
    }

    public function test_user_can_be_demoted(): void
    {
        $user = new User;
        $user->promoteToAdmin();
        $user->demoteToUser();

        $this->assertFalse($user->isAdmin());
        $this->assertSame(UserRole::USER, (string) $user->role);
    }

    public function test_email_value_object_validates(): void
    {
        $email = Email::from('John@Example.com');

        $this->assertSame('john@example.com', (string) $email);
    }

    public function test_email_value_object_rejects_invalid_email(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Email::from('not-an-email');
    }

    public function test_user_role_rejects_invalid_value(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        UserRole::from('superuser');
    }
}
