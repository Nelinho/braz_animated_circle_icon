import 'package:braz_animated_circle_icon/src/widgets/circle_widget.dart';
import 'package:flutter/material.dart';

class BrazAnimatedCircleIconWidget extends StatefulWidget {
  final double size;
  final Color color;
  final IconData icon;

  const BrazAnimatedCircleIconWidget(
      {Key key, this.size, this.color = Colors.green, this.icon = Icons.check})
      : super(key: key);
  @override
  _BrazAnimatedCircleIconWidgetState createState() => _BrazAnimatedCircleIconWidgetState();
}

class _BrazAnimatedCircleIconWidgetState extends State<BrazAnimatedCircleIconWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _scaleAnimation1;
  Animation<double> _scaleAnimation2;
  Animation<double> _scaleAnimation3;
  Animation<double> _scaleAnimation4;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 2000))
          ..addListener(() {
            setState(() {});
          });

    _scaleAnimation1 = new Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(new CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.2,
          1.0,
          curve: Curves.elasticOut,
        )));

    _scaleAnimation2 = new Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(new CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.3,
          1.0,
          curve: Curves.elasticOut,
        )));

    _scaleAnimation3 = new Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(new CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.4,
          1.0,
          curve: Curves.elasticOut,
        )));

    _scaleAnimation4 = new Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(new CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.5,
          1.0,
          curve: Curves.elasticOut,
        )));

    super.initState();
    _controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new LayoutBuilder(builder: (context, constraint) {
      double parentSize = constraint.biggest.width;

      return Stack(alignment: Alignment.center, children: [
        (widget.size == null && parentSize > 60) || (widget.size != null && widget.size > 60) ? Transform.scale(
          scale: _scaleAnimation1.value,
          child: Container(
            width: widget.size == null ? parentSize : widget.size,
            height: widget.size == null ? parentSize : widget.size,
            child: CircleWidget(
              color: widget.color,
              stroke: 1,
            ),
          ),
        ):Container(),
        Transform.scale(
          scale: _scaleAnimation2.value,
          child: Container(
            width: widget.size == null ? parentSize - 6 : widget.size - 6,
            height: widget.size == null ? parentSize - 6 : widget.size - 6,
            child: CircleWidget(
              color: widget.color,
              stroke: 2,
            ),
          ),
        ),
        Transform.scale(
          scale: _scaleAnimation3.value,
          child: Container(
            width: widget.size == null ? parentSize - 10 : widget.size - 10,
            height: widget.size == null ? parentSize - 10 : widget.size - 10,
            child: CircleWidget(
              color: widget.color,
              stroke: 0,
              paintingStyle: PaintingStyle.fill,
            ),
          ),
        ),
        Transform.scale(
            scale: _scaleAnimation4.value,
            child: Icon(
              widget.icon,
              color: Colors.white,
              size: widget.size != null
                  ? (widget.size * .55)
                  : (parentSize * .55),
            ))
      ]);
    });
  }
}
