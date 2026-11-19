# Security Policy

## Supported Versions

| Version | Supported          |
|---------|--------------------|
| 1.0.x   | :white_check_mark: |
| < 1.0   | :x:                |

## Reporting a Vulnerability

We take security seriously. If you discover a security vulnerability, please
report it responsibly.

**Do not open a public GitHub issue.** Instead, use one of these private
channels:

1. **GitHub Security Advisories** (preferred):
   Go to the "Security" tab of this repository and select "Report a
   vulnerability" to create a private draft security advisory.

2. **Email**: security@rasimaghayev.com

Include the following in your report:
* Description of the vulnerability
* Steps to reproduce
* Affected components and versions
* Possible impact
* Suggested fix (if any)
* Evidence (logs, screenshots, redacted output)

## Response Timeline

| Severity | Response Time | Fix Target |
|----------|---------------|------------|
| P0 — Critical | Immediate (< 4 h) | 24 h |
| P1 — High | 24 h | 72 h |
| P2 — Medium | 48 h | 1 week |
| P3 — Low | 72 h | 1 month |

## Scope

In scope:
* Application source code
* CI/CD pipelines and configuration
* Docker images and build configuration
* Dependencies (Composer, npm)
* Secrets and credential handling

Out of scope:
* Issues requiring social engineering
* Issues in third-party services not operated by us

## Disclosure Process

1. **Acknowledge** — We confirm receipt within the response timeline above.
2. **Triage** — We validate the report and assign severity.
3. **Fix** — We develop and test a fix in Docker, then deploy to staging.
4. **Coordinated disclosure** — We publish the fix and credit the reporter
   (unless they prefer to remain anonymous).
5. **Rotation** — Any exposed secrets are rotated immediately.

## Safe Harbor

We will not pursue legal action against security researchers who:
* Act in good faith
* Follow this disclosure policy
* Do not access or modify user data beyond what is needed to demonstrate the
  vulnerability
* Do not disrupt services
