import 'package:flutter/rendering.dart';

class MyDiscPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xFF00FF00)..style = PaintingStyle.stroke;
    double radius = 50.00;
    Offset offSet = Offset(size.width / 2, size.height /2);
    canvas.drawCircle(offSet, radius, paint);
    canvas.save();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}