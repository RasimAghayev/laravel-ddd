# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- DDD architecture: Domain / Application / Infrastructure / Presentation layers
- Orders domain: entity, OrderStatus VO, repository, use cases, controller, resources, requests, migration, factory, tests
- Products domain: entity, ProductStatus VO, repository, use cases, controller, resources, requests, migration, factory, tests
- AuditLog domain: entity, repository, use cases, controller, resources, requests, migration, factory, tests
- Docker files moved into `server/{php,nginx,composer}/` subfolders
- `docker-compose.yml` moved into `server/` with updated build contexts
- GitHub Actions CI workflow (PHP 8.5, sqlite)

### Changed
- Package renamed from `laravel/laravel` to `rasimagayev/laravel-ddd`
- Cars migration updated to match domain model (brand, model, year, price_cents, currency, status)
- PHP requirement bumped to `^8.5.12`
- README rewritten with architecture docs, API endpoints, Docker usage, setup steps

### Removed
- Placeholder `ExampleTest` (Feature + Unit)
- `secrets/` directory from git tracking (plaintext credentials)
- `composer.lock` from tracking

### Security
- Removed 7 plaintext secret files from repository history (`db_password`, etc.)

## [1.0.0] - 2026-11-19

### Added
- Initial DDD refactor: Cars and Users domains
- REST API v1 routes, controllers, resources, form requests
- Feature + Unit tests for Cars and Users
- Docker setup (nginx, php, composer, artisan, phpunit, pgsql, redis)
