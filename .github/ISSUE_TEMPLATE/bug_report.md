---
name: 🐛 Bug Report
about: Report a bug or unexpected behavior in Gauge Progress
title: "[BUG] Short description"
labels: bug
assignees: ''
---

## 🐛 Describe the Bug
A clear and concise description of what the issue is.

---

## 🔁 Steps To Reproduce

Please provide detailed steps to reproduce the behavior:

1. Set `GaugeType` to `...`
2. Use percentage value `...`
3. Run on device/emulator `...`
4. Observe the issue

If possible, include a minimal reproducible code snippet:

```dart
GaugeProgress(
  percentage: 75,
  type: GaugeType.semiCircular,
)