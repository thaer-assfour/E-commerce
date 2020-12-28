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

    path.lineTo(0.0, size.height * 0.10);

    path.quadraticBezierTo(
        size.width / 2, size.height * 0.01, size.width  , size.height * 0.11);


    path.lineTo(size.width, 0.0);

    paint.color = Color(0xff6990B9)/*Colors.orangeAccent.withOpacity(0.9)*/;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
