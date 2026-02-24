import 'package:flutter/material.dart';
import 'package:gauge_progress/src/gauge_painter.dart';

import 'gauge_type.dart';

/// A customizable and lightweight gauge progress indicator widget.
///
/// [GaugeProgress] renders different gauge styles such as:
/// - Semi circular
/// - Full circular
/// - Segmented
/// - Dashed
/// - Speedometer
/// - Multi range
///
/// The [percentage] value should be between 0 and 100.
///
/// Example:
///
/// ```dart
/// GaugeProgress(
///   percentage: 75,
///   type: GaugeType.semiCircular,
/// )
/// ```
class GaugeProgress extends StatelessWidget {
  /// The progress value displayed by the gauge.
  ///
  /// Expected range: `0` to `100`.
  /// Values outside this range will be clamped internally.
  final double percentage;

  /// Defines the visual style of the gauge.
  ///
  /// See [GaugeType] for available options.
  final GaugeType type;

  /// Optional label displayed below the percentage text.
  final String? label;

  /// Whether to display the percentage text in the center.
  final bool showText;

  /// Color of the progress arc.
  ///
  /// Ignored if [gradient] is provided.
  final Color progressColor;

  /// Color of the background arc.
  final Color backgroundColor;

  /// Optional gradient applied to the progress arc.
  ///
  /// If provided, it overrides [progressColor].
  final Gradient? gradient;

  /// Stroke width of the progress arc.
  final double progressStrokeWidth;

  /// Stroke width of the background arc.
  final double backgroundStrokeWidth;

  /// Overall width and height of the gauge widget.
  final double size;

  /// Number of segments used in [GaugeType.segmented] and
  /// [GaugeType.dashed] gauge types.
  final int segments;

  /// Colors used for [GaugeType.multiRange].
  ///
  /// If not provided, default colors will be used.
  final List<Color>? multiRangeColors;

  /// Creates a [GaugeProgress] widget.
  ///
  /// The [percentage] defaults to `0`.
  /// The default [type] is [GaugeType.semiCircular].
  const GaugeProgress({
    super.key,
    this.percentage = 0,
    this.type = GaugeType.semiCircular,
    this.label,
    this.showText = true,
    this.progressColor = Colors.blue,
    this.backgroundColor = const Color(0xFFE9EDF0),
    this.gradient,
    this.progressStrokeWidth = 20,
    this.backgroundStrokeWidth = 10,
    this.size = 200,
    this.segments = 12,
    this.multiRangeColors,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: GaugePainter(
          percentage: percentage,
          type: type,
          progressColor: progressColor,
          backgroundColor: backgroundColor,
          gradient: gradient,
          progressStrokeWidth: progressStrokeWidth,
          backgroundStrokeWidth: backgroundStrokeWidth,
          segments: segments,
          multiRangeColors: multiRangeColors,
        ),
        child: showText
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${percentage.toStringAsFixed(0)}%",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    if (label != null) ...[
                      const SizedBox(height: 6),
                      Text(
                        label!,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ],
                ),
              )
            : null,
      ),
    );
  }
}
