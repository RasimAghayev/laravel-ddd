# Deployment

## Overview

Laravel DDD is deployed as Docker containers. The application is a stateless PHP app behind nginx, backed by PostgreSQL and Redis.

## Environments

| Environment | Purpose | URL |
|-------------|---------|-----|
| development | Local development | http://localhost |
| staging | Pre-production validation | — |
| production | Live traffic | — |

## Deployment Steps

1. Build images: `make build`
2. Run tests: `make test`
3. Start containers: `make up`
4. Run migrations: `make migrate`
5. Run seeders (if needed): `make seed`

## Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| APP_PORT | 80 | HTTP port |
| APP_PORT_SSL | 443 | HTTPS port |
| DB_CONNECTION | pgsql | Database driver |
| DB_HOST | pgsql | Database host |
| DB_PORT | 5432 | Database port |
| DB_DATABASE | laravel | Database name |
| DB_USERNAME | root | Database user |
| DB_PASSWORD | root | Database password |
| REDIS_HOST | redis | Redis host |
| REDIS_PASSWORD | root | Redis password |

## Database Migrations

Run `docker compose run --rm artisan migrate` to apply migrations.

## Rollback

Roll back migrations: `docker compose run --rm artisan migrate:rollback`

## Health Checks

`GET /api/v1/health` returns `{"status":"ok"}`.
