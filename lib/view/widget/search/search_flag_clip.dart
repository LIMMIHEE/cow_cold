import 'package:flutter/material.dart';

class SearchFlagClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final widthPercent = size.width / 100;
    final heightPercent = size.height / 100;

    var path = Path();
    path.lineTo(widthPercent * 97, 0);
    path.quadraticBezierTo(widthPercent * 103, heightPercent * 5,
        widthPercent * 97, heightPercent * 20);
    path.lineTo(widthPercent * 90, heightPercent * 40);
    path.quadraticBezierTo(widthPercent * 85, heightPercent * 50,
        widthPercent * 90, heightPercent * 60);
    path.lineTo(widthPercent * 97, heightPercent * 78);
    path.quadraticBezierTo(
        widthPercent * 103, heightPercent * 95, widthPercent * 97, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
