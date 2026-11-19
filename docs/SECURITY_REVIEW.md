# Security Review

## Scope

Code, CI/CD, Docker images, dependencies, secrets.

## Findings

| ID | Severity | Finding | Location | Status |
|----|----------|---------|----------|--------|
| SR-001 | High | No API authentication | routes/api.php | open |
| SR-002 | Medium | No rate limiting | routes/api.php | open |
| SR-003 | Low | `composer.lock` untracked | repo root | open |
| SR-004 | Low | No secret scanning pre-commit | .github/ | open |

## Remediation

* Add Laravel Sanctum for token-based API authentication
* Add throttle middleware to API routes
* Decide on `composer.lock` tracking policy
* Add gitleaks/secret scanning to pre-commit and CI

## Private Reporting

Use GitHub Security Advisories or email security@rasimaghayev.com. Never open public issues for vulnerabilities.

## Coordinated Disclosure

Acknowledge → Triage → Fix → Coordinated disclosure → Rotate exposed secrets.
