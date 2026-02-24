# Changelog

All notable changes to this project will be documented in this file.

The format is based on Keep a Changelog,
and this project adheres to Semantic Versioning.

---

## [1.0.1] - 2026-02-24

### 🔧 Improved

- Enhanced dartdoc coverage for better pub.dev scoring
- Improved public API documentation
- Minor internal code refactoring
- Optimized repaint conditions in `GaugePainter`

### 🐛 Fixed

- Minor percentage clamping edge cases
- Stroke alignment consistency improvements
- Label rendering spacing adjustment

### 📚 Documentation

- Updated README with clearer usage examples
- Added preview GIF support instructions
- Improved installation and feature descriptions

---

## [1.0.0] - 2026-02-24

### 🚀 Initial Professional Release

#### ✨ Added

- Semi Circular Gauge
- Full Circular Gauge
- Segmented Gauge
- Dashed Gauge
- Speedometer (Needle) Gauge
- Multi-Range Gauge (Green/Yellow/Red zones)
- Gradient support for progress arc
- Adjustable stroke width (progress & background)
- Optional center text & label
- Responsive sizing support
- Customizable segment count
- Professional dashboard example app

#### 🏗 Architecture

- Built using CustomPainter
- Optimized repaint logic
- Lightweight & high-performance drawing
- Clean and extensible `GaugeType` enum structure

---

## [0.1.0]

### 🎉 Initial Development Version

- Basic semi-circular gauge implementation
- Core CustomPainter logic