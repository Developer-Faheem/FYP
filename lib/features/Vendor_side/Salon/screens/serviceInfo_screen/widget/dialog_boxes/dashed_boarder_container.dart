import 'package:flutter/material.dart';

class DashedBorderContainer extends StatelessWidget {
  final Widget child;
  final double strokeWidth;
  final Color color;

  const DashedBorderContainer({
    Key? key,
    required this.child,
    this.strokeWidth = 1.0,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedBorderPainter(
        strokeWidth: strokeWidth,
        color: color,
      ),
      child: child,
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final double strokeWidth;
  final Color color;

  DashedBorderPainter({
    this.strokeWidth = 1.0,
    this.color = Colors.black,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    const double dashWidth = 5.0;
    const double gapWidth = 5.0;

    double startX = 0.0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + gapWidth;
    }

    double endY = size.height;

    while (endY > 0) {
      canvas.drawLine(
        Offset(size.width, size.height - endY),
        Offset(size.width, size.height - endY + dashWidth),
        paint,
      );
      endY -= dashWidth + gapWidth;
    }

    double endX = size.width;

    while (endX > 0) {
      canvas.drawLine(
        Offset(size.width - endX, size.height),
        Offset(size.width - endX + dashWidth, size.height),
        paint,
      );
      endX -= dashWidth + gapWidth;
    }

    double startY = size.height;

    while (startY > 0) {
      canvas.drawLine(
        Offset(0, size.height - startY),
        Offset(0, size.height - startY + dashWidth),
        paint,
      );
      startY -= dashWidth + gapWidth;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
