name: Bug Report
description: File a bug report for Laravel DDD
title: "[Bug] "
labels: ["bug"]
body:
  - type: markdown
    attributes:
      value: "## Bug Report\n\nPlease provide a clear and concise description of the bug."
  - type: input
    id: environment
    attributes:
      label: Environment
      description: Docker image tag, PHP version, OS
      placeholder: e.g. PHP 8.5, Docker, Ubuntu 22.04
    validations:
      required: true
  - type: textarea
    id: steps
    attributes:
      label: Steps to Reproduce
      description: Clear steps to reproduce the issue
      placeholder: |
        1. Go to '...'
        2. Click on '....'
        3. Scroll down to '....'
        4. See error
    validations:
      required: true
  - type: textarea
    id: expected
    attributes:
      label: Expected Behavior
      description: What you expected to happen
    validations:
      required: true
  - type: textarea
    id: actual
    attributes:
      label: Actual Behavior
      description: What actually happened
    validations:
      required: true
  - type: textarea
    id: evidence
    attributes:
      label: Evidence
      description: Logs, screenshots, redacted output
      placeholder: Paste logs or error output here. Never include secrets or passwords.
    validations:
      required: false
  - type: dropdown
    id: severity
    attributes:
      label: Severity
      options:
        - P0 - Critical
        - P1 - High
        - P2 - Medium
        - P3 - Low
    validations:
      required: true
