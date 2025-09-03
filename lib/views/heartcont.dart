import 'package:flutter/material.dart';

class HeartShape extends StatelessWidget {
  const HeartShape({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipPath(
        clipper: HeartClipper(),
        child: Container(
         
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                const Color.fromARGB(255, 244, 139, 171),
                 const Color.fromARGB(255, 233, 71, 128),
                const Color.fromARGB(255, 239, 78, 132),
                const Color.fromARGB(255, 240, 108, 152),
                 const Color.fromARGB(255, 255, 44, 114)
              ]
            )
          ),
          width: 160,
          height: 270,
        //    child: 
        //   SizedBox(
        //   height: 60,
        //   width: 40,
        // child:   Text("90", style: TextStyle(fontSize: 20, 
        // fontWeight: FontWeight.bold),)),
          //color: const Color.fromARGB(255, 250, 40, 110), // background color of heart
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

    path.moveTo ( width / 2, height * 0.9);
    path.cubicTo(
      width * 1.4, height * 0.6, // right curve
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
