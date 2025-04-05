import 'package:flutter/widgets.dart';

class TopLeftPart extends CustomPainter {
  final Color color;

  TopLeftPart( this.color);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0); //
    path.lineTo(size.width * 0.8, 0);

    path.arcToPoint(
      Offset(0, size.height * 0.3),
      radius: Radius.circular(10),
      clockwise: false,
    );
    path.lineTo(-7, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
