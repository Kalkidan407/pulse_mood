import 'package:flutter/material.dart';

class HeartShape extends StatelessWidget {
  const HeartShape({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipPath(
        clipper: HeartClipper(),
        child: Container(
          width: 190,
          height: 270,
          color: Colors.red, // background color of heart
        ),
      ),
    );
  }
}

class HeartClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final width = size.width;
    final height = size.height;

    path.moveTo(width / 2, height * 0.9);
    path.cubicTo(
      width * 2.4, height * 0.6, // right curve
      width * 0.8, height * 0.1, // top right
      width / 2, height * 0.3,   // top middle
    );
    path.cubicTo(
      width * 0.2, height * 0.1, // top left
      -width * 0.4, height * 0.6, // left curve
      width / 2, height * 0.9,   // back to bottom
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
