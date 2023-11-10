import 'package:flutter/material.dart';

class CustomBottomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final widthPercent = size.width / 100;
    final heightPercent = size.height / 100;

    var path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(
        size.width - (widthPercent * 10), size.height - (heightPercent * 30));
    path.quadraticBezierTo(size.width - (widthPercent * 14),
        heightPercent * 105, size.width - (widthPercent * 35), size.height);
    path.lineTo(widthPercent * 38, size.height);
    path.quadraticBezierTo(widthPercent * 14, heightPercent * 105,
        widthPercent * 10, size.height - (heightPercent * 30));
    path.lineTo(widthPercent * 10, size.height - (heightPercent * 30));
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
