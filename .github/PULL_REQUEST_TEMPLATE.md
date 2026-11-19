name: Pull Request Template
description: Standard PR template for Laravel DDD
title: ""
labels: []
body:
  - type: markdown
    attributes:
      value: "## Pull Request Checklist\n\nPlease verify each item before submitting."
  - type: checkboxes
    id: checks
    attributes:
      label: Pre-submission checklist
      options:
        - label: Branch is `phase-<n>/<topic>` cut from `preview`
          required: true
        - label: PR title is a Conventional Commit title (e.g. `feat: ...`)
          required: true
        - label: One logical change per commit
          required: true
        - label: `make verify` is green (build + test in Docker)
          required: true
        - label: Tests added or updated
          required: true
        - label: Documentation updated (README, docs, CHANGELOG)
          required: true
        - label: No AI co-author or session trailer in commits/PR
          required: true
        - label: No secrets or credentials committed
          required: true
  - type: textarea
    id: description
    attributes:
      label: Description
      description: What does this PR change and why?
    validations:
      required: true
  - type: input
    id: related-issue
    attributes:
      label: Related Issue
      description: Link to the issue this PR resolves
      placeholder: https://github.com/RasimAghayev/laravel-ddd/issues/###
    validations:
      required: false
  - type: dropdown
    id: change-type
    attributes:
      label: Change Type
      options:
        - feat
        - fix
        - refactor
        - perf
        - test
        - build
        - ci
        - docs
        - chore
        - revert
    validations:
      required: true
  - type: textarea
    id: verification
    attributes:
      label: Verification
      description: Command used to verify + exit code (e.g. `docker compose run --rm artisan test` → exit 0)
    validations:
      required: true
  - type: textarea
    id: risk-rollback
    attributes:
      label: Risk / Rollback
      description: What could go wrong and how to roll back?
    validations:
      required: false
