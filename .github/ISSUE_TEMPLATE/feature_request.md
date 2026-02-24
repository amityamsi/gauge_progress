---
name: 🚀 Feature Request
about: Suggest a new feature or improvement for Gauge Progress
title: "[FEATURE] Short description"
labels: enhancement
assignees: ''
---

## 🚀 Feature Summary
Provide a short and clear summary of the feature you'd like to see.

---

## 🤔 Problem Statement

Is your feature request related to a problem?

Describe the issue clearly. For example:

> I want to customize tick marks in `GaugeType.speedometer`, but there is currently no way to configure them.

---

## 💡 Proposed Solution

Describe the solution you'd like:

- Add new parameter(s): `showTicks`, `tickCount`, `needleWidth`
- Support animation for percentage changes
- Allow gradient per segment
- Add label positioning customization

Provide example usage if possible:

```dart
GaugeProgress(
  percentage: 80,
  type: GaugeType.speedometer,
  showTicks: true,
  tickCount: 10,
)