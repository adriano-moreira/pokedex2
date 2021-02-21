import 'package:flutter/material.dart';

class Pikachu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          CustomPaint(
            painter: _FacePainter(),
          )
        ],
      ),
    );
  }
}

const _yellow = Color(0xFFFCE600);

class _FacePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint fill = Paint()..color = _yellow;
    Paint border = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.black;

    Path face = Path()
      ..addOval(
        Rect.fromLTWH(100, 100, 84, 66),
      );

    Path ear1 = Path()
      ..addOval(
        Rect.fromLTWH(105, 80, 20, 66),
      );

    Path ear2 = Path()
      ..addOval(
        Rect.fromLTWH(160, 80, 20, 66),
      );

    final path = Path.combine(
      PathOperation.union,
      Path.combine(PathOperation.union, face, ear1),
      ear2,
    );

    canvas.drawPath(path, fill);
    canvas.drawPath(path, border);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
