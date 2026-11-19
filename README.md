# Laravel DDD

![Views](https://hits.sh/github.com/RasimAghayev/laravel-ddd.svg?label=views&color=0e75b6)

DDD (Domain-Driven Design) Laravel API with Domain / Application / Infrastructure / Presentation layers.

## Architecture

```
src/be/app/
├── Domain/              # Enterprise business logic
│   ├── Cars/            # Car aggregate
│   ├── Users/           # User aggregate
│   ├── Orders/          # Order aggregate (NEW)
│   ├── Products/        # Product aggregate (NEW)
│   ├── AuditLog/        # Audit log aggregate (NEW)
│   └── Shared/          # Shared kernels (Criteria, etc.)
├── Application/         # Use cases + DTOs
│   ├── Cars/
│   ├── Users/
│   ├── Orders/
│   ├── Products/
│   └── AuditLog/
├── Infrastructure/      # External concerns (Eloquent repositories)
│   └── Persistence/Eloquent/
├── Providers/           # DI bindings (RepositoryServiceProvider)
└── Http/                # Presentation layer
    ├── Controllers/API/
    ├── Resources/
    └── Requests/
```

### Layers

| Layer | Responsibility |
|-------|---------------|
| **Domain** | Entities, Value Objects, Repository interfaces |
| **Application** | Use cases, DTOs, application services |
| **Infrastructure** | Eloquent repository implementations |
| **Presentation** | Controllers, API Resources, FormRequests, routes |

## API Endpoints (v1)

| Resource | Endpoints |
|----------|-----------|
| Cars | `GET/POST /api/v1/cars`, `GET/PUT/DELETE /api/v1/cars/{id}` |
| Users | `GET/POST /api/v1/users`, `GET/PUT/DELETE /api/v1/users/{id}` |
| Orders | `GET/POST /api/v1/orders`, `GET/PUT/DELETE /api/v1/orders/{id}` |
| Products | `GET/POST /api/v1/products`, `GET/PUT/DELETE /api/v1/products/{id}` |
| AuditLogs | `GET/POST /api/v1/audit-logs`, `GET /api/v1/audit-logs/{id}` |
| Health | `GET /api/v1/health` |

## Docker

Dockerfiles and compose live under `server/`.

```
server/
├── docker-compose.yml
├── php/Dockerfile
├── nginx/Dockerfile
└── composer/Dockerfile
```

### Create Laravel project

```shell
cd server
docker-compose run --rm composer create-project --prefer-dist laravel/laravel .
```

### Build and start containers

```shell
cd server
docker-compose up -d --build nginx
```

### Install dependencies

```shell
cd server
docker-compose run --rm composer install
```

### Run Artisan commands

```shell
cd server
docker compose run --rm artisan storage:link
docker compose run --rm artisan migrate
docker compose run --rm artisan db:seed
docker compose run --rm artisan optimize:clear
```

### Run tests

```shell
cd server
docker compose run --rm artisan test
# or directly with phpunit
docker compose run --rm phpunit
```

## Setup Steps

1. Clone the repo
2. `cd server && docker-compose up -d --build nginx`
3. `docker-compose run --rm composer install`
4. Copy `.env.example` to `.env` and configure
5. `docker compose run --rm artisan key:generate`
6. `docker compose run --rm artisan migrate`
7. `docker compose run --rm artisan db:seed`

## Testing

Feature and Unit tests cover Cars, Users, Orders, Products, and AuditLog aggregates.

Run locally (requires vendor installed):

```shell
cd src/be
vendor/bin/phpunit
```

## Requirements

- PHP 8.5+
- Composer
- Docker & Docker Compose
- PostgreSQL / Redis (via docker-compose)
