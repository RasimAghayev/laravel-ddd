# Baseline

## Baseline Date

2026-11-19

## Test Results

| Suite | Tests | Pass | Fail | Skip |
|-------|-------|------|------|------|
| Feature (Cars) | 7 | 7 | 0 | 0 |
| Feature (Users) | 8 | 8 | 0 | 0 |
| Feature (Orders) | 7 | 7 | 0 | 0 |
| Feature (Products) | 7 | 7 | 0 | 0 |
| Feature (AuditLog) | 4 | 4 | 0 | 0 |
| Feature (Invoices) | 7 | 7 | 0 | 0 |
| Feature (Payments) | 7 | 7 | 0 | 0 |
| Feature (Notifications) | 7 | 7 | 0 | 0 |
| Unit (Cars) | 5 | 5 | 0 | 0 |
| Unit (Users) | 5 | 5 | 0 | 0 |
| Unit (Orders) | 5 | 5 | 0 | 0 |
| Unit (Products) | 3 | 3 | 0 | 0 |
| Unit (AuditLog) | 2 | 2 | 0 | 0 |
| Unit (Invoices) | 3 | 3 | 0 | 0 |
| Unit (Payments) | 3 | 3 | 0 | 0 |
| Unit (Notifications) | 3 | 3 | 0 | 0 |
| **Total** | **75** | **75** | **0** | **0** |

## Key API Endpoints (Baseline)

* `GET/POST /api/v1/cars`
* `GET/PUT/DELETE /api/v1/cars/{id}`
* `GET/POST /api/v1/users`
* `GET/PUT/DELETE /api/v1/users/{id}`
* `GET/POST /api/v1/orders`
* `GET/PUT/DELETE /api/v1/orders/{id}`
* `GET/POST /api/v1/products`
* `GET/PUT/DELETE /api/v1/products/{id}`
* `GET/POST /api/v1/audit-logs`
* `GET /api/v1/audit-logs/{id}`
* `GET/POST /api/v1/invoices`
* `GET/PUT/DELETE /api/v1/invoices/{id}`
* `GET/POST /api/v1/payments`
* `GET/PUT/DELETE /api/v1/payments/{id}`
* `GET/POST /api/v1/notifications`
* `GET/PUT/DELETE /api/v1/notifications/{id}`
* `GET /api/v1/health`

## Docker Services

| Service | Image | Port | Healthcheck |
|---------|-------|------|-------------|
| nginx | custom (nginx:stable-alpine) | 80/443 | — |
| php | custom (php:8.5-fpm) | 9000 | — |
| pgsql | postgres:latest | 6432 | — |
| redis | redis:alpine | 8002 | — |

## Notes

Tests run against SQLite in-memory in CI. No pre-existing failures. This baseline is the contract for regression testing (Phase 5 standing decision).
