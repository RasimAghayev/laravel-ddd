# Accessibility Statement

## Commitment

The Laravel DDD project is designed to be usable by people with disabilities.
For any web UI, our target conformance level is **WCAG 2.1 AA**. This includes
keyboard navigation, screen-reader compatibility, and color-contrast
compliance.

## Supported Environments

* **Browsers**: Chrome, Firefox, Safari, Edge (latest two versions)
* **Assistive technology**: NVDA, JAWS, VoiceOver, TalkBack
* **Operating systems**: Windows, macOS, Linux
* **Devices**: Desktop, laptop, tablet, mobile

## Known Limitations

* This project is primarily a backend API; no frontend web UI is currently
  included.
* API responses are JSON and do not include ARIA attributes (not applicable
  for headless APIs).
* Documentation examples may not meet color-contrast requirements when copied
  into other contexts.

## How to Report Barriers

Use the [issue template](.github/ISSUE_TEMPLATE/bug.md) tagged with
`accessibility`, or email security@rasimaghayev.com. We will acknowledge
reports within 48 hours and provide a remediation timeline within one week.

## Review Cycle

This statement is reviewed at least once per major version release.
