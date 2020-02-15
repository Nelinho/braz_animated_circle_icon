import 'package:flutter/material.dart';

class CircleShapeWidget extends CustomPainter {
  Paint _paint;

  CircleShapeWidget({
    double stroke = 2, 
    Color color = Colors.green, 
    PaintingStyle paintingStyle = PaintingStyle.stroke}) {

    _paint = Paint()
      ..color = color
      ..strokeWidth = stroke
      ..style = paintingStyle;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}