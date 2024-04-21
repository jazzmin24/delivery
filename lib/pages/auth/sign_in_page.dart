import 'dart:developer';

import 'package:delivery/base/custom_loader.dart';
import 'package:delivery/base/show_custom_snackbar.dart';
import 'package:delivery/controllers/auth_controller.dart';
import 'package:delivery/pages/auth/sign_up_page.dart';
import 'package:delivery/routes/route_helper.dart';
import 'package:delivery/utils/colors.dart';
import 'package:delivery/utils/dimentions.dart'; // Keep the import statement as it is
import 'package:delivery/widgets/app_text_field.dart';
import 'package:delivery/widgets/big_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key});

  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  void _login(AuthController authController) {
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    print("start registration");
    print("pass registration");
    if (phone.isEmpty) {
      showCustomSnackBar("Type in your phone number", title: "Phone number");
      log('message 1');
    } else if (password.isEmpty) {
      showCustomSnackBar("Type in your password", title: "Password");
      log('message 2');
    } else if (password.length < 6) {
      showCustomSnackBar("Password can not be less than six characters",
          title: "Password");
      log('message 3');
    } else {
      log('message 4');
      authController.login(phone, password).then((status) {
        if (status.isSuccess) {
          Get.toNamed(RouteHelper.getCartPage());
          log('message 5');
          // Get.back();
          print("sucess registration");
        } else {
          showCustomSnackBar("error hai bhyiii ", title: "can't fetch details");
          log('message 6');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(
        builder: (authController) => !authController.isLoading
            ? SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: Dimentions.screenHeight * 0.05,
                    ),
                    //app logo
                    Container(
                      height: Dimentions.screenHeight * 0.25,
                      child: Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 80,
                          backgroundImage: AssetImage('assets/image/logo.jpg'),
                        ),
                      ),
                    ),
                    //welcome
                    Container(
                      margin: EdgeInsets.only(left: Dimentions.width20),
                      child: Column(
                        children: [
                          Text(
                            'Hello',
                            style: TextStyle(
                              fontSize:
                                  Dimentions.font20 * 3 + Dimentions.font20 / 2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Sign into your account',
                            style: TextStyle(
                              fontSize: Dimentions.font20,
                              color: Colors.grey[500],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimentions.height20,
                    ),
                    //your email
                    AppTextField(
                      textController: phoneController,
                      hintText: 'Phone',
                      icon: Icons.phone,
                    ),
                    SizedBox(
                      height: Dimentions.height20,
                    ),
                    //your password
                    AppTextField(
                      textController: passwordController,
                      hintText: 'Password',
                      icon: Icons.password_sharp,
                      isObscure: true,
                    ),
                    SizedBox(
                      height: Dimentions.height20,
                    ),

                    //tag line

                    RichText(
                      text: TextSpan(
                        text: "Sign into your account",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Dimentions.font20,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: Dimentions.screenHeight * 0.05,
                    ),

                    //sign in button
                    GestureDetector(
                      onTap: () {
                        _login(authController);
                      },
                      child: Container(
                        width: Dimentions.screenWidth / 3,
                        height: Dimentions.screenHeight / 13,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimentions.radius30),
                          color: AppColors.mainColor,
                        ),
                        child: Center(
                          child: BigText(
                            text: 'Sign In',
                            size: Dimentions.font20 + Dimentions.font20 / 2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimentions.screenHeight * 0.05,
                    ),

                    //sign up options
                    RichText(
                      text: TextSpan(
                        text: "Don\'t have an account?",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Dimentions.font20,
                        ),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.to(() => SignUpPage(),
                                  transition: Transition.fade),
                            text: "  Create",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: Dimentions.font20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : CustomLoader(),
      ),
    );
  }
}
