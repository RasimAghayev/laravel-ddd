name: Feature Request
description: Suggest a new feature for Laravel DDD
title: "[Feature] "
labels: ["enhancement"]
body:
  - type: markdown
    attributes:
      value: "## Feature Request\n\nPlease describe the feature you'd like to see."
  - type: textarea
    id: problem
    attributes:
      label: Problem
      description: What problem are you trying to solve?
      placeholder: I'm always frustrated when [...]
    validations:
      required: true
  - type: textarea
    id: solution
    attributes:
      label: Proposed Solution
      description: Describe the solution you'd like
    validations:
      required: true
  - type: textarea
    id: alternatives
    attributes:
      label: Alternatives Considered
      description: Describe any alternative solutions or features you've considered
    validations:
      required: false
  - type: textarea
    id: business-value
    attributes:
      label: Business Value
      description: Why is this feature valuable?
    validations:
      required: true
  - type: textarea
    id: acceptance-criteria
    attributes:
      label: Acceptance Criteria
      description: How will we know this feature is complete?
    validations:
      required: true
