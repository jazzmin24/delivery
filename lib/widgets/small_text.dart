import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class SmallText extends StatelessWidget {
  //these are dymanic since text alg hoga hr jgha and color bhi vary kr skta h
  final Color? color; //que mark may or may not pass color
  final String text;
  double size;
  double height;

//constructor
  SmallText({
    Key? key,
    this.color =
        const Color(0xFF332d2b), //default color in case koi specified ni h
    this.size = 12, //default
    this.height=1.2,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
      // GoogleFonts.roboto(
        TextStyle(
          color: color, fontSize: size, fontWeight: FontWeight.w400 , height: height  ),
    );
  }
}
