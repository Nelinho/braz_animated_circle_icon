import 'package:braz_animated_circle_icon/src/widgets/circle_shape_widget.dart';
import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  final double stroke;
  final Color color;
  final PaintingStyle paintingStyle;

  CircleWidget(
      {this.stroke = 2,
      this.color = Colors.green,
      this.paintingStyle = PaintingStyle.stroke});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CircleShapeWidget(
          stroke: stroke,
          color: color,
          paintingStyle: paintingStyle,
          ),
    );
  }
}
