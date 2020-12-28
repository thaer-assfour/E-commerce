import 'package:flutter/material.dart';

class SplashTopPainter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(),
      painter: PathPainter(),
    );
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path.lineTo(0.0, size.height * 0.2);

    path.quadraticBezierTo(
        size.width / 5, size.height * 0.3, size.width / 5, size.height * 0.2);

    path.quadraticBezierTo(size.width *0.75, size.height * 0.2,
        size.width, size.height * 0.1);

    path.lineTo(size.width, 0.0);

    paint.color = Colors.orangeAccent.withOpacity(0.3);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
