import 'package:flutter/material.dart';
import 'package:delivery/utils/dimentions.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:google_fonts/google_fonts.dart';

class BigText extends StatelessWidget {
  //these are dymanic since text alg hoga hr jgha and color bhi vary kr skta h
  final Color? color; //que mark may or may not pass color
  final String text;
  double size;
  TextOverflow overFlow;

//constructor
  BigText(
      {Key? key,
      this.color =
          const Color(0xFF332d2b), //default color in case koi specified ni h
      this.size = 0, //default
      required this.text,
      this.overFlow = TextOverflow
          .ellipsis //if text is overflown ellipsis(dots) will appear

      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1, //should not exeed 1 line
      overflow: overFlow,
      style: GoogleFonts.roboto(
          color: color,
          fontSize: size == 0 ? Dimentions.font20 : size,
          fontWeight: FontWeight.w400),
    );
  }
}
