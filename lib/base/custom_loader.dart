import 'package:delivery/controllers/auth_controller.dart';
import 'package:delivery/utils/colors.dart';
import 'package:delivery/utils/dimentions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    print("I am printing loading state"+Get.find<AuthController>().isLoading.toString());
    return Container(
      height: Dimentions.height20 * 5,
      width: Dimentions.height20 * 5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimentions.height20 * 5 / 2),
          color: AppColors.mainColor),
          alignment: Alignment.center,
          child: CircularProgressIndicator(color: Colors.white),
    );
  }
}
