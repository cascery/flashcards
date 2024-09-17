import 'dart:ui';

import 'package:flutter/material.dart';

class RotatingCircle extends StatefulWidget {
  final Widget child;

  const RotatingCircle({Key? key, required this.child}) : super(key: key);

  @override
  _RotatingCircleState createState() => _RotatingCircleState();
}

class _RotatingCircleState extends State<RotatingCircle> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 15),
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
    return Stack(
      alignment: Alignment.center,
      children: [
        RotationTransition(
          turns: _controller,
          child: CustomPaint(
            size: const Size(600, 600), // Adjust the size as needed
            painter: DashedBorderPainter(),
          ),
        ),
        widget.child, // Center the child widget within the rotating circle
      ],
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 7;
    double dashSpace = 14;
    double radius = size.width / 2;

    var paint = Paint()
      ..color = const Color(0xFFF4C4DB)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    Path path = Path()
      ..addOval(Rect.fromCircle(center: Offset(radius, radius), radius: radius));

    Path dashPath = Path();
    double distance = 0.0;

    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashPath.addPath(pathMetric.extractPath(distance, distance + dashWidth), Offset.zero);
        distance += dashWidth + dashSpace;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
