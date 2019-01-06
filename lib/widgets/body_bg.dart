
import 'package:flutter/material.dart';

class BodyBg extends StatelessWidget {

  final Widget child;

  BodyBg({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        child: child,
        size: Size.fromWidth(double.infinity),
        painter: BgPainter(),
      ),
    );
  }
}

class BgPainter extends CustomPainter{

  final Color color;

  BgPainter({Color color}):this.color = color == null ? Color(0xFF131235) : color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = this.color;
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, .4 * size.height)
      ..quadraticBezierTo(.3 * size.width, .45 * size.height, size.width, .2 * size.height)
      ..lineTo(size.width, 0)
    ;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}