# ADR-003: composer.lock Untracked

## Status

Accepted

## Context

The `composer.lock` file was removed from git tracking. The `.gitignore` excludes `/src/be/composer.lock`.

## Decision

`composer.lock` is intentionally NOT tracked in version control. Dependabot manages weekly dependency updates. Developers run `composer install` to generate a lockfile locally.

## Consequences

### Positive

* No lockfile merge conflicts
* Dependabot drives dependency updates

### Negative

* Dependency versions are not pinned in the repo
* Different developers may get different dependency versions

## Mitigation

* Dependabot creates weekly PRs for dependency updates
* CI tests against whatever `composer install` resolves

## Alternatives Considered

| Alternative | Why Rejected |
|-------------|--------------|
| Track `composer.lock` | Was previously tracked; decision to untrack for this project |
| Commit lockfile with CI check | Adds merge conflict overhead |

## Related

* docs/TECHNICAL_DEBT.md TD-001
