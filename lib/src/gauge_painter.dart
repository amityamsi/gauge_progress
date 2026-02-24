import 'dart:math';
import 'package:flutter/material.dart';

import 'gauge_type.dart';

/// A custom painter responsible for rendering
/// different gauge styles for [GaugeProgress].
///
/// This painter handles all drawing logic including:
/// - Semi-circular gauges
/// - Full circular gauges
/// - Segmented gauges
/// - Dashed gauges
/// - Speedometer gauges
/// - Multi-range gauges
///
/// The [percentage] value is normalized internally between 0 and 100.
class GaugePainter extends CustomPainter {
  /// The progress value of the gauge.
  ///
  /// Expected range: `0` to `100`.
  final double percentage;

  /// The type of gauge to render.
  final GaugeType type;

  /// Color used to paint the active progress arc.
  ///
  /// Ignored if [gradient] is provided.
  final Color progressColor;

  /// Color used to paint the background arc.
  final Color backgroundColor;

  /// Optional gradient applied to the progress arc.
  ///
  /// Overrides [progressColor] if provided.
  final Gradient? gradient;

  /// Stroke width of the active progress arc.
  final double progressStrokeWidth;

  /// Stroke width of the background arc.
  final double backgroundStrokeWidth;

  /// Number of segments used for
  /// [GaugeType.segmented] and [GaugeType.dashed].
  final int segments;

  /// Colors used for the [GaugeType.multiRange] gauge.
  ///
  /// If null, default green/orange/red colors are used.
  final List<Color>? multiRangeColors;

  /// Creates a [GaugePainter].
  ///
  /// All parameters are required and control
  /// the visual rendering of the gauge.
  GaugePainter({
    required this.percentage,
    required this.type,
    required this.progressColor,
    required this.backgroundColor,
    required this.gradient,
    required this.progressStrokeWidth,
    required this.backgroundStrokeWidth,
    required this.segments,
    required this.multiRangeColors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2.5;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final normalized = percentage.clamp(0, 100) / 100;

    double startAngle = pi * 0.75;
    double sweepAngle = pi * 1.5;

    if (type == GaugeType.fullCircular ||
        type == GaugeType.radial ||
        type == GaugeType.dashed) {
      startAngle = -pi / 2;
      sweepAngle = 2 * pi;
    }

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = backgroundStrokeWidth
      ..strokeCap = StrokeCap.round;

    final progressPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = progressStrokeWidth
      ..strokeCap = StrokeCap.round;

    if (gradient != null) {
      progressPaint.shader = gradient!.createShader(rect);
    } else {
      progressPaint.color = progressColor;
    }

    switch (type) {
      case GaugeType.segmented:
        final segmentAngle = sweepAngle / segments;
        final active = (segments * normalized).round();

        for (int i = 0; i < segments; i++) {
          canvas.drawArc(
            rect,
            startAngle + segmentAngle * i,
            segmentAngle * 0.7,
            false,
            i < active ? progressPaint : backgroundPaint,
          );
        }
        break;

      case GaugeType.dashed:
        const dashCount = 40;
        final dashAngle = sweepAngle / dashCount;
        final active = (dashCount * normalized).round();

        for (int i = 0; i < dashCount; i++) {
          canvas.drawArc(
            rect,
            startAngle + dashAngle * i,
            dashAngle * 0.5,
            false,
            i < active ? progressPaint : backgroundPaint,
          );
        }
        break;

      case GaugeType.speedometer:
        canvas.drawArc(rect, startAngle, sweepAngle, false, backgroundPaint);

        final needleAngle = startAngle + (sweepAngle * normalized);
        final needleLength = radius;

        final needlePaint = Paint()
          ..color = progressColor
          ..strokeWidth = 3;

        final needleEnd = Offset(
          center.dx + needleLength * cos(needleAngle),
          center.dy + needleLength * sin(needleAngle),
        );

        canvas.drawLine(center, needleEnd, needlePaint);
        canvas.drawCircle(center, 6, needlePaint);
        break;

      case GaugeType.multiRange:
        final colors =
            multiRangeColors ?? [Colors.green, Colors.orange, Colors.red];

        final part = sweepAngle / colors.length;

        for (int i = 0; i < colors.length; i++) {
          final paint = Paint()
            ..color = colors[i]
            ..style = PaintingStyle.stroke
            ..strokeWidth = progressStrokeWidth;

          canvas.drawArc(rect, startAngle + (part * i), part, false, paint);
        }
        break;

      default:
        canvas.drawArc(rect, startAngle, sweepAngle, false, backgroundPaint);
        canvas.drawArc(
          rect,
          startAngle,
          sweepAngle * normalized,
          false,
          progressPaint,
        );
    }
  }

  @override
  bool shouldRepaint(covariant GaugePainter oldDelegate) =>
      oldDelegate.percentage != percentage || oldDelegate.type != type;
}
