# Improvement Roadmap

## Short Term (Next Release)

1. Track `composer.lock` or document the decision
2. Add Laravel Sanctum for API authentication (P3 from audit)
3. Add API rate limiting middleware
4. Add `openapi.yaml` contract
5. Add PHPStan static analysis

## Medium Term

1. Extract shared library (`rasimagayev/shared-lib`) per Phase 13
2. Add soft deletes to domain entities
3. Document database backup/recovery procedure
4. Add API versioning strategy
5. Add observability (structured logging, metrics)

## Long Term

1. Consider service extraction for high-traffic domains (Orders, Payments)
2. Add event sourcing for AuditLog if replay requirements emerge
3. Multi-tenant support
4. Mobile/API client SDKs

## Not Planned

* Full Event Sourcing — no replay requirement
* CQRS — read/write models identical
* Microservices — single deployable suffices
