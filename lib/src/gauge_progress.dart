import 'package:flutter/material.dart';
import 'package:gauge_progress/src/gauge_painter.dart';

import 'gauge_type.dart';

class GaugeProgress extends StatelessWidget {
  final double percentage;
  final GaugeType type;

  final String? label;
  final bool showText;

  final Color progressColor;
  final Color backgroundColor;
  final Gradient? gradient;

  final double progressStrokeWidth;
  final double backgroundStrokeWidth;
  final double size;

  final int segments;
  final List<Color>? multiRangeColors;

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
