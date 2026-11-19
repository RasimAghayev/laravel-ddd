# Technical Debt

## Items

| ID | Item | Severity | Location | Status | Notes |
|----|------|----------|----------|--------|-------|
| TD-001 | `composer.lock` not tracked | Medium | repo root | open | Dependabot manages updates; lockfile intentionally untracked |
| TD-002 | No PHP static analysis | Medium | composer.json | open | Add PHPStan/Psalm |
| TD-003 | No API authentication | High | routes/api.php | open | Endpoints open; add Laravel Sanctum |
| TD-004 | No rate limiting | Medium | routes/api.php | open | Add middleware |
| TD-005 | Validation rules duplicated | Low | app/Http/Requests/ | open | Consider shared request base class |
| TD-006 | No soft deletes | Low | Domain entities | open | Consider soft deletes for audit-friendly deletes |

## Blockers

None currently.

## Escalation

Per standing decision 1, blockers are re-attempted at every Dependabot/Renovate cycle. After 3 consecutive unresolved cycles, escalate to the project owner.
