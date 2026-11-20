# Test Report

Generated: 2026-11-20
Repo: RasimAghayev/laravel-ddd
CI Status: Deferred to GitHub Actions (Docker unavailable on host)

## Test Summary

| Layer | Files | Test Methods | Status |
|-------|-------|--------------|--------|
| Feature | 8 | 55 | Implemented, not executed |
| Unit | 8 | 40 | Implemented, not executed |
| Total | 16 | 95 | Implemented, not executed |

## Feature Tests (TC_*_FEATURE_*)

| Module | Test Cases | Status |
|--------|-----------|--------|
| Cars | TC_CARS_FEATURE_001–007 | Implemented |
| Users | TC_USERS_FEATURE_001–008 | Implemented |
| Orders | TC_ORDERS_FEATURE_001–007 | Implemented |
| Products | TC_PRODUCTS_FEATURE_001–007 | Implemented |
| AuditLog | TC_AUDITLOG_FEATURE_001–005 | Implemented |
| Invoices | TC_INVOICES_FEATURE_001–007 | Implemented |
| Payments | TC_PAYMENTS_FEATURE_001–007 | Implemented |
| Notifications | TC_NOTIFICATIONS_FEATURE_001–007 | Implemented |

## Unit Tests (TC_*_UNIT_*)

| Module | Test Cases | Status |
|--------|-----------|--------|
| Cars | TC_CARS_UNIT_001–005 | Implemented |
| Users | TC_USERS_UNIT_001–006 | Implemented |
| Orders | TC_ORDERS_UNIT_001–006 | Implemented |
| Products | TC_PRODUCTS_UNIT_001–004 | Implemented |
| AuditLog | TC_AUDITLOG_UNIT_001–002 | Implemented |
| Invoices | TC_INVOICES_UNIT_001–005 | Implemented |
| Payments | TC_PAYMENTS_UNIT_001–006 | Implemented |
| Notifications | TC_NOTIFICATIONS_UNIT_001–006 | Implemented |

## Coverage

Code coverage is not measured locally (no pcov/xdebug available). Coverage will be reported from GitHub Actions once CI passes.

## Known Limitations

- Tests deferred to GitHub Actions (Docker not available on host)
- CI was red before this fix (ISSUE-1: vimeo/psalm version constraint); fixed in this commit
- No mutation tests
- No performance/load tests

## Next Steps

1. Push to trigger GitHub Actions CI
2. Verify CI passes (Pint + Psalm + PHPUnit)
3. Update this report with actual results and coverage
