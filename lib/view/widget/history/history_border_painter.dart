import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class HistoryBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final widthPercent = size.width / 100;
    final heightPercent = size.height / 100;

    var path = Path();
    path.moveTo(0, 12);
    path.quadraticBezierTo(0, 0, 12, 0);
    path.lineTo(size.width - 12, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 12);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(widthPercent * 101, heightPercent * 115,
        widthPercent * 70, size.height);
    path.lineTo(widthPercent * 70, size.height);
    path.lineTo(widthPercent * 50, heightPercent * 92);
    path.lineTo(widthPercent * 30, size.height);
    path.quadraticBezierTo(0, heightPercent * 115, 0, size.height);
    path.lineTo(0, size.height - 12);
    path.close();

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = DesignSystem.colors.gray700.withOpacity(0.5);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
