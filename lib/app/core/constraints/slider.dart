import 'package:flutter/material.dart';

class CustomSquareSliderThumbShape extends SliderComponentShape {
  final double thumbRadius;

  const CustomSquareSliderThumbShape({
    required this.thumbRadius,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    final Canvas canvas = context.canvas;

    final Paint thumbPaint = Paint()
      ..color = sliderTheme.thumbColor!
      ..style = PaintingStyle.fill;

    final double radius = thumbRadius;

    canvas.drawRect(
      Rect.fromCenter(
        center: center,
        width: radius * 2,
        height: radius * 2,
      ),
      thumbPaint,
    );
  }
}
