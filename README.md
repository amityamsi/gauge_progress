# Flutter Custom Gauge

A highly customizable and lightweight Flutter gauge widget built using `CustomPainter`.

Supports multiple styles including circular, radial, segmented, dashed, speedometer, and multi-range gauges.

Perfect for dashboards, analytics apps, fitness tracking, finance apps, and performance indicators.

---

## ✨ Features

- ✅ Full Circular Gauge  
- ✅ Radial Gauge  
- ✅ Segmented Gauge  
- ✅ Dashed Gauge  
- ✅ Speedometer Gauge (with needle)  
- ✅ Multi-Range Gauge  
- ✅ Gradient Support  
- ✅ Custom Stroke Width  
- ✅ Custom Colors  
- ✅ Segment Control  
- ✅ Lightweight & Performant  

---

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  your_package_name: ^1.0.0
```

Then run:

```bash
flutter pub get
```

---

## 🚀 Usage

### Basic Example

```dart
CustomGauge(
  percentage: 75,
  type: GaugeType.fullCircular,
  progressColor: Colors.blue,
  backgroundColor: Colors.grey.shade300,
)
```

---

## 🎯 Available Gauge Types

```dart
GaugeType.fullCircular
GaugeType.radial
GaugeType.segmented
GaugeType.dashed
GaugeType.speedometer
GaugeType.multiRange
```

---

## 🧩 Complete Example

```dart
CustomGauge(
  percentage: 65,
  type: GaugeType.segmented,
  progressColor: Colors.green,
  backgroundColor: Colors.grey.shade300,
  progressStrokeWidth: 12,
  backgroundStrokeWidth: 10,
  segments: 20,
)
```

---

## 🌈 Gradient Support

```dart
CustomGauge(
  percentage: 80,
  type: GaugeType.fullCircular,
  gradient: LinearGradient(
    colors: [Colors.blue, Colors.purple],
  ),
)
```

If `gradient` is provided, it overrides `progressColor`.

---

## 🧭 Speedometer Example

```dart
CustomGauge(
  percentage: 45,
  type: GaugeType.speedometer,
  progressColor: Colors.red,
)
```

---

## 🎨 Multi-Range Example

```dart
CustomGauge(
  percentage: 70,
  type: GaugeType.multiRange,
  multiRangeColors: [
    Colors.green,
    Colors.orange,
    Colors.red,
  ],
)
```

---

## ⚙️ Properties

| Property | Type | Description |
|----------|------|-------------|
| percentage | double | Value between 0–100 |
| type | GaugeType | Gauge style |
| progressColor | Color | Active progress color |
| backgroundColor | Color | Background arc color |
| gradient | Gradient? | Gradient for progress |
| progressStrokeWidth | double | Stroke width of progress |
| backgroundStrokeWidth | double | Stroke width of background |
| segments | int | Number of segments (segmented type) |
| multiRangeColors | List<Color>? | Colors for multi-range |

---

## 📊 Percentage Handling

- Automatically clamps between **0 and 100**
- Smooth repaint updates
- Optimized `shouldRepaint` implementation

---

## 🏗 Built With

- `CustomPainter`
- Optimized canvas drawing
- Minimal dependencies
- Clean structure

---

## 💡 Use Cases

- Fitness progress indicators
- Revenue dashboards
- App performance meters
- Speed indicators
- Health tracking apps
- Battery indicators

---

## 🤝 Contributing

Contributions are welcome!

If you find a bug or want to request a feature:

1. Open an issue
2. Create a pull request
3. Improve documentation

---

## 📄 License

MIT License

---

⭐ If you like this package, consider giving it a star!