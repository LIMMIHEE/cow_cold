import 'package:flutter/material.dart';

class CustomFlagClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final widthPercent = size.width / 100;
    final heightPercent = size.height / 100;

    var path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, heightPercent * 55);
    path.quadraticBezierTo(widthPercent * 105, heightPercent * 115,
        widthPercent * 75, heightPercent * 90);
    path.lineTo(widthPercent * 75, heightPercent * 90);
    path.lineTo(widthPercent * 50, heightPercent * 70);
    path.lineTo(widthPercent * 25, heightPercent * 90);
    path.quadraticBezierTo(0, heightPercent * 110, 0, heightPercent * 80);
    path.lineTo(0, heightPercent * 55);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
