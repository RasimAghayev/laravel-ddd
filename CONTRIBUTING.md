# Contributing to Laravel DDD

Thank you for considering contributing to Laravel DDD! This document outlines
the process for reporting bugs, proposing features, and submitting pull requests.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How to Report Bugs](#how-to-report-bugs)
- [How to Propose Features](#how-to-propose-features)
- [Development Setup](#development-setup)
- [Pull Request Process](#pull-request-process)
- [Commit Message Conventions](#commit-message-conventions)
- [Review Process](#review-process)
- [AI-Attribution Rule](#ai-attribution-rule)

## Code of Conduct

This project adheres to the Contributor Covenant Code of Conduct. By
participating, you are expected to uphold this code. Please read
[CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) for details.

## How to Report Bugs

Use the [bug report template](.github/ISSUE_TEMPLATE/bug.md). Include:

* Environment (Docker image tag, PHP version, OS)
* Steps to reproduce
* Expected vs actual behavior
* Evidence (logs, screenshots, redacted output)
* Severity

**Never paste secrets, passwords, or tokens.** If you accidentally paste one,
notify a maintainer immediately so it can be redacted and rotated.

## How to Propose Features

Use the [feature request template](.github/ISSUE_TEMPLATE/feature.md). Describe:

* The problem you're trying to solve
* Your proposed solution
* Alternatives you've considered
* Business value and acceptance criteria

## Development Setup

All development happens inside Docker containers. Nothing runs on the host.

```shell
# Clone the repository
git clone https://github.com/RasimAghayev/laravel-ddd.git
cd laravel-ddd/server

# Copy environment example
cp .env.example .env
# Edit .env with your local values (never commit .env)

# Build and start containers
docker-compose up -d --build nginx

# Install dependencies
docker-compose run --rm composer install

# Generate application key
docker compose run --rm artisan key:generate

# Run migrations
docker compose run --rm artisan migrate

# Seed the database (optional)
docker compose run --rm artisan db:seed

# Run tests
docker compose run --rm artisan test
```

Or use the Makefile:

```shell
make verify      # build + test
make up          # start containers (depends on verify)
make shell       # open a shell in the PHP container
make migrate     # run migrations
make seed        # run seeders
make test        # run the test suite
```

## Pull Request Process

1. Create a branch from `preview`: `git checkout -b phase-<n>/<topic> preview`
2. Make your changes (one logical change per commit)
3. Run `make verify` locally — it must be green
4. Open a PR against `preview`
5. PR title must be a Conventional Commit title (e.g. `feat: add orders domain`)
6. Fill in the [pull request template](.github/PULL_REQUEST_TEMPLATE.md)
7. Ensure CI is green before requesting review
8. A maintainer will review and merge after CI passes

Never use `--no-verify`. All pre-commit hooks must pass.

## Commit Message Conventions

We use [Conventional Commits](https://www.conventionalcommits.org/):

* `feat:` — new feature
* `fix:` — bug fix
* `refactor:` — code change that neither fixes a bug nor adds a feature
* `perf:` — performance improvement
* `test:` — adding or correcting tests
* `build:` — changes to build system or dependencies
* `ci:` — changes to CI configuration
* `docs:` — documentation changes
* `chore:` — maintenance tasks
* `revert:` — revert a previous commit

Append `!` or `BREAKING CHANGE:` for breaking changes.

## Review Process

* One PR per phase per repository
* Maintainers merge after CI is green
* Required status checks must pass
* No force push to protected branches

## AI-Attribution Rule

No commit, PR title, PR description, or PR/issue comment carries an AI
co-author or session trailer (e.g. `Co-Authored-By: Claude ...`,
`Claude-Session: ...`). Authorship is the contributor's alone. Strip any
auto-appended AI trailer before committing.

## License

This project is licensed under the MIT License — see [LICENSE](LICENSE).
