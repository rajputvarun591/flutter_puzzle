import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class MyGridPainter extends CustomPainter {
  final Color tileColor;

  MyGridPainter(this.tileColor);
  @override
  void paint(Canvas canvas, Size size) {
    const double lineGap = 30.00;
    Paint paint = Paint()
      ..color = tileColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.00;
    Offset offsetTTB1 = Offset(size.width / 3, lineGap);
    Offset offsetTTB1E = Offset(size.width / 3, size.height - lineGap);

    Offset offsetTTB2 = Offset(size.width / 1.5, lineGap);
    Offset offsetTTB2E = Offset(size.width / 1.5, size.height - lineGap);

    Offset offsetLTR1 = Offset(lineGap, size.height / 3);
    Offset offsetLTR1E = Offset(size.width - lineGap, size.height / 3);

    Offset offsetLTR2 = Offset(lineGap, size.height / 1.5);
    Offset offsetLTR2E = Offset(size.width - lineGap, size.height / 1.5);

    Path path1 = Path()
      ..moveTo(offsetTTB1.dx, offsetTTB1.dy)
      ..lineTo(offsetTTB1E.dx, offsetTTB1E.dy)
      ..close();

    Path path2 = Path()
      ..moveTo(offsetTTB2.dx, offsetTTB2.dy)
      ..lineTo(offsetTTB2E.dx, offsetTTB2E.dy)
      ..close();

    Path path3 = Path()
      ..moveTo(offsetLTR1.dx, offsetLTR1.dy)
      ..lineTo(offsetLTR1E.dx, offsetLTR1E.dy)
      ..close();

    Path path4 = Path()
      ..moveTo(offsetLTR2.dx, offsetLTR2.dy)
      ..lineTo(offsetLTR2E.dx, offsetLTR2E.dy)
      ..close();

    canvas.drawPath(path1, paint);
    canvas.drawPath(path2, paint);
    canvas.drawPath(path3, paint);
    canvas.drawPath(path4, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
