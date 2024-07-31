import 'dart:math';

import 'package:flutter/material.dart';

class LoadingAnimation extends StatefulWidget {
  final Color color;
  final double size;

  const LoadingAnimation({
    required this.color,
    this.size = 100,
    super.key,
  });

  @override
  _LoadingAnimationState createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _WeatherLoadingPainter(
        animation: _controller,
        color: widget.color,
      ),
      child: SizedBox(
        width: widget.size,
        height: widget.size,
      ),
    );
  }
}

class _WeatherLoadingPainter extends CustomPainter {
  final Animation<double> animation;
  final Color color;

  _WeatherLoadingPainter({required this.animation, required this.color})
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    final radius = size.width / 3;
    final center = Offset(size.width / 2, size.height / 2);
    final angle = animation.value * 2 * pi;

    // Draw the sun
    canvas.drawCircle(center, radius, paint);

    // Draw the rotating sunrays
    for (int i = 0; i < 8; i++) {
      final x1 = center.dx + radius * cos(angle + i * pi / 4);
      final y1 = center.dy + radius * sin(angle + i * pi / 4);
      final x2 = center.dx + (radius + 10) * cos(angle + i * pi / 4);
      final y2 = center.dy + (radius + 10) * sin(angle + i * pi / 4);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);
    }

    // Draw the cloud
    final cloudPaint = Paint()
      ..color = color.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    final cloudPath = Path()
      ..moveTo(center.dx - radius / 2, center.dy + radius)
      ..arcToPoint(Offset(center.dx + radius / 2, center.dy + radius),
          radius: Radius.circular(radius / 2))
      ..arcToPoint(Offset(center.dx - radius / 2, center.dy + radius),
          radius: Radius.circular(radius / 2))
      ..close();

    canvas.drawPath(cloudPath, cloudPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
