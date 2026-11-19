# ADR-001: DDD Layered Architecture

## Status

Accepted

## Context

The Laravel DDD API manages multiple business domains (Cars, Users, Orders, Products, AuditLog, Invoices, Payments, Notifications) with real domain complexity and invariants. A flat controller-service-repository structure would mix concerns and make the codebase hard to maintain as it grows.

## Decision

Apply a four-layer DDD architecture:

1. **Domain** — Entities, Value Objects, Repository interfaces
2. **Application** — Use Cases, DTOs
3. **Infrastructure** — Eloquent repository implementations
4. **Presentation** — Controllers, Resources, FormRequests, Routes

## Consequences

### Positive

* Clear separation of concerns
* Business logic is testable without infrastructure
* Repository interfaces allow swapping persistence (Eloquent → Doctrine → external API)
* Domain invariants are enforced in Value Objects and Entities

### Negative

* More files and boilerplate than a simple CRUD app
* Learning curve for new contributors

## Alternatives Considered

| Alternative | Why Rejected |
|-------------|--------------|
| Flat controller-service | Mixes concerns, hard to test business logic |
| Full Hexagonal with adapters | Over-engineering for current scope |
| Microservices | No team boundaries or independent deployment needs |

## Related

* CLAUDE.md decision 7 (Design principles)
* PROMPT.md Phase 8 (Architecture)
