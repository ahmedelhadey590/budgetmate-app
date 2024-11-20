// CustomPainter class to create a curved shape
import 'package:flutter/material.dart';

class CurvedPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // Starting point of the path (top-left corner)
    path.lineTo(0.0, size.height - 50);

    // Create a curved shape using cubic Bezier curve
    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEndPoint = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    // Complete the path to the bottom-right corner and back to the top-right
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
