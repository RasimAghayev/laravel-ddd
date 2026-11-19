# Laravel DDD - AGENTS.md

## Project Overview

Laravel DDD (Domain-Driven Design) API with Cars, Users, Orders, Products, and AuditLog domains. Docker-based local development.

## Repository Structure

```
laravel-ddd/
├── server/                  # Docker configuration
│   ├── docker-compose.yml
│   ├── php/Dockerfile
│   ├── nginx/Dockerfile
│   └── composer/Dockerfile
├── src/be/                  # Laravel application
│   ├── app/
│   │   ├── Domain/          # DDD domain layer (entities, VOs, repository interfaces)
│   │   ├── Application/     # Use cases + DTOs
│   │   ├── Infrastructure/  # Eloquent repository implementations
│   │   ├── Http/            # Controllers, Resources, Requests
│   │   └── Providers/       # RepositoryServiceProvider
│   ├── bootstrap/app.php    # Registers RepositoryServiceProvider + API routes
│   ├── database/
│   │   ├── migrations/
│   │   └── factories/
│   ├── routes/api.php       # REST v1 routes
│   ├── tests/
│   │   ├── Feature/
│   │   └── Unit/
│   └── composer.json
├── .github/workflows/laravel.yml   # CI (PHP 8.5, sqlite)
├── README.md
├── LICENSE
├── .gitignore
└── AGENTS.md
```

## Key Commands

All Docker commands run from `server/`:

```shell
cd server
docker-compose up -d --build nginx     # Start containers
docker-compose run --rm composer install
docker compose run --rm artisan migrate
docker compose run --rm artisan test   # Run tests
```

## CI

- `.github/workflows/laravel.yml` — PHP 8.5, sqlite, `php artisan test`
- Runs on push to `master`

## Coding Conventions

- PHP `declare(strict_types=1);` on every file
- PSR-4 autoload: `DDD\\` → `app/`, `Database\\Factories\\` → `database/factories/`
- Domain layer: entities extend Eloquent Model, Value Objects are `final`, repository interfaces in `Domain/*/Repository/`
- Application layer: Use cases + DTOs in `Application/*/`
- Infrastructure: Eloquent repositories in `Infrastructure/Persistence/Eloquent/*/`
- Presentation: Controllers in `Http/Controllers/API/`, Resources in `Http/Resources/`, FormRequests in `Http/Requests/`
- Route prefix: `v1` → `/api/v1/{resource}`
- Tests: `Tests\Feature\*` and `Tests\Unit\Domain\*`

## Notes

- `composer.lock` is NOT tracked (in `.gitignore`)
- `secrets/` directory removed from tracking, added to `.gitignore`
- PHP version: `^8.5.12` in composer.json
- No composer or docker available on host — all builds/tests run in Docker

## Commit Message Style

```
type: subject

body (optional)
```

Types: `feat`, `fix`, `refactor`, `docs`, `chore`, `test`, `style`, `perf`, `ci`, `build`, `revert`
