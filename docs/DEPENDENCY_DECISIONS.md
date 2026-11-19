# Dependency Decisions

## Policy

Dependencies are added only after analysis (standing decision 3, CLAUDE.md). Each entry documents:
* What existing deps/stdlib already cover
* Maintenance status
* License
* Known vulnerabilities
* Size
* Latest stable version

## Approved Dependencies

| Package | Purpose | Version | License | Decision |
|---------|---------|---------|---------|----------|
| laravel/framework | Application framework | ^12.0 | MIT | Core framework |
| laravel/tinker | REPL console | ^3.0 | MIT | Dev tool |
| fakerphp/faker | Test data generation | ^1.23 | MIT | Dev dependency |
| laravel/pint | Code formatter | ^1.18 | MIT | Dev dependency |
| laravel/sail | Docker dev environment | ^1.37 | MIT | Dev dependency |
| mockery/mockery | Test mocking | ^1.6 | BSD-3-Clause | Dev dependency |
| nunomaduro/collision | Better CLI error output | ^8.5 | MIT | Dev dependency |
| phpunit/phpunit | Test framework | ^11.4 | MIT | Dev dependency |

## Unmaintained/Deprecated

None currently.

## Cross-Repo Libraries

None currently published. `rasimagayev/shared-lib` planned (Phase 13).

## License Decision

MIT — permissive, suitable for a personal open-source service project.

## Vulnerability Process

Dependabot weekly updates (Monday 06:00 UTC). Security advisories reviewed privately.
