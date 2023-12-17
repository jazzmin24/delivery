import 'package:flutter/material.dart';
import 'package:delivery/utils/colors.dart';
import 'package:delivery/utils/dimentions.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  bool isObscure;
   AppTextField(
      {super.key,
      required this.textController,
      required this.hintText,
      required this.icon,
      this.isObscure=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: Dimentions.height20,
        right: Dimentions.height20,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimentions.radius15),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 7,
              offset: Offset(1, 10),
              color: Colors.grey.withOpacity(0.2),
            )
          ]),
      child: TextField(
        obscureText: isObscure?true:false,
        controller: textController,
        decoration: InputDecoration(
            //hintText
            hintText: hintText,
            //prefixIcon
            prefixIcon: Icon(
              icon,
              color: AppColors.yellowColor,
            ),
            //focusedBorder
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimentions.radius15),
                borderSide: BorderSide(
                  width: 1.0,
                  color: Colors.white,
                )),
            //enabledBorder
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimentions.radius15),
                borderSide: BorderSide(
                  width: 1.0,
                  color: Colors.white,
                )),
            //border
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimentions.radius15),
            )),
      ),
    );
  }
}
