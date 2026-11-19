name: Documentation
description: Request or suggest documentation changes
title: "[Docs] "
labels: ["documentation"]
body:
  - type: markdown
    attributes:
      value: "## Documentation Issue\n\nPlease describe what documentation needs to be added or changed."
  - type: input
    id: page
    attributes:
      label: Page / Section
      description: Which page or section is affected?
      placeholder: e.g. README.md, docs/ARCHITECTURE.md
    validations:
      required: true
  - type: textarea
    id: issue
    attributes:
      label: Issue
      description: What is wrong or missing?
    validations:
      required: true
  - type: textarea
    id: suggestion
    attributes:
      label: Suggested Change
      description: What should be changed or added?
    validations:
      required: true
