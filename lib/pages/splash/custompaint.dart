import 'package:flutter/material.dart';

class SplashTopPainter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(child: Container(),painter: PathPainter(),

    );
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);

    path.quadraticBezierTo(size.width / 2, size.height/4, size.width, size.height / 5 );
    path.close();
    canvas.drawPath(path, paint);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
