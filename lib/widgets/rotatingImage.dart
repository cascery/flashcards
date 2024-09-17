import 'dart:ui';

import 'package:flutter/material.dart';

class RotatingImage extends StatefulWidget {
  final double size;

  const RotatingImage({Key? key, required this.size}) : super(key: key);

  @override
  _RotatingImageState createState() => _RotatingImageState();
}

class _RotatingImageState extends State<RotatingImage> with SingleTickerProviderStateMixin {
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
            size: Size(widget.size, widget.size),
            painter: DashedBorderPainter(),
          ),
        ),
        ClipOval(
          child: Image.asset(
            'assets/images/julian2.jpg', // Replace with your image asset
            width: widget.size * 0.714, // Adjusted to fit within the rotating border
            height: widget.size * 0.714,
            fit: BoxFit.cover,
          ),
        ),
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
      ..color = Color(0xFFF4C4DB)
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
