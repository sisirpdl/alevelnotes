import 'package:flutter/material.dart';

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // var path = Path()

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.9666667);
    path0.lineTo(0, 0);
    path0.lineTo(size.width, 0);
    path0.lineTo(size.width, size.height * 0.7787879);
    path0.quadraticBezierTo(size.width * 0.8965278, size.height * 0.8401515,
        size.width * 0.5000000, size.height * 0.8454545);
    path0.quadraticBezierTo(size.width * 0.1090278, size.height * 0.8522727, 0,
        size.height * 0.9666667);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
