# ADR-002: Docker-First Development

## Status

Accepted

## Context

CLAUDE.md standing decision 2 requires everything to be built, tested, and run in containers. Nothing runs on the host for verification.

## Decision

All development, testing, and CI runs in Docker containers. The repository includes:

* `server/docker-compose.yml` — multi-service orchestration
* `server/php/Dockerfile` — PHP 8.5-FPM with extensions
* `server/nginx/Dockerfile` — nginx for serving the app
* `server/composer/Dockerfile` — Composer dependency management
* `Makefile` — `make verify` = build + test gate

## Consequences

### Positive

* Consistent environment across all machines
* No "works on my machine" issues
* CI and local development use identical containers

### Negative

* Slower feedback loop than running PHP directly on host
* Requires Docker to be installed

## Alternatives Considered

| Alternative | Why Rejected |
|-------------|--------------|
| Host-based development | Violates standing decision 2 |
| Vagrant | Heavier than Docker, slower provisioning |

## Related

* CLAUDE.md standing decision 2 (Docker-first)
* PROMPT.md Phase 5 (Container baseline)
