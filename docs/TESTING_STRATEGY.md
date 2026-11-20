# Testing Strategy

## Scope

All 8 bounded contexts (Cars, Users, Orders, Products, AuditLog, Invoices, Payments, Notifications) are covered by Feature and Unit tests.

## Test Layers

### Feature Tests (`tests/Feature/<Domain>/<Domain>ApiTest.php`)

Tests the REST API v1 endpoints for each domain. Covers:

- `GET` /list — index with pagination
- `POST` /store — create with validation
- `GET` /{id} — show single resource
- `PUT/PATCH` /{id} — update
- `DELETE` /{id} — delete
- 404 for missing resource
- 422 validation errors
- Email uniqueness (Users)
- Database state assertions (`assertDatabaseHas` / `assertDatabaseMissing`)

Each Feature test uses `RefreshDatabase` for test isolation.

### Unit Tests (`tests/Unit/Domain/<Domain>/<Domain>Test.php`)

Tests domain entities and Value Objects in isolation. Covers:

- Entity default state
- Entity lifecycle transitions (activate, sell, reserve, confirm, ship, deliver, cancel, etc.)
- Value Object construction and validation
- Value Object rejection of invalid values (`InvalidArgumentException`)

Unit tests extend `PHPUnit\Framework\TestCase` (no database).

## Test Case IDs

Each test case is identified as `TC_<MODULE>_<SCENARIO>_<NUMBER>` in `docs/TEST_REPORT.md`.

## Test Data

- Factories under `database/factories/Domain/<Domain>/<Model>Factory.php`
- Unique values per test run to avoid duplicate-key conflicts
- SQLite in-memory database for CI

## Coverage Goals

- Happy path: list/create/show/update/delete for every domain
- Edge cases: 404, 422 validation
- Domain invariants: VO validation, state transitions

## Execution

```bash
# Local (Docker)
make test

# CI (GitHub Actions)
# .github/workflows/laravel.yml — Pint + Psalm + PHPUnit on sqlite
```
