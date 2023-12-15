import 'package:delivery/base/custom_loader.dart';
import 'package:delivery/base/show_custom_snackbar.dart';
import 'package:delivery/controllers/auth_controller.dart';
import 'package:delivery/models/signup_body_model.dart';
import 'package:delivery/utils/colors.dart';
import 'package:delivery/utils/dimentions.dart';
import 'package:delivery/widgets/app_text_field.dart';
import 'package:delivery/widgets/big_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    //var authController = Get.find<AuthController>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = ["t.png", "f.png", "g.png"];

    void _registration(AuthController authController) {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
        showCustomSnackBar("Type in your name", title: "Name");
      } else if (phone.isEmpty) {
        showCustomSnackBar("Type in your phone number", title: "Phone number");
      } else if (email.isEmpty) {
        showCustomSnackBar("Type in your email address",
            title: "Email address");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in your valid email address",
            title: "Valid email address");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your password", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password can not be less than six characters",
            title: "Password");
      } else {
        showCustomSnackBar("All went well!", title: "Perfect");
        SignUpBody signUpBody = SignUpBody(
            name: name, phone: phone, email: email, password: password);
        authController.registration(signUpBody).then((status) {
          if (status.isSuccess) {
            print("sucess registration");
          } else {
            showCustomSnackBar(status.message);
          }
        });
        //  print(signUpBody.toString());
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(builder: (_authController) {
          return !_authController.isLoading
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
                            backgroundImage:
                                AssetImage('assets/image/logo.jpg'),
                          ),
                        ),
                      ),
                      //your email
                      AppTextField(
                          textController: emailController,
                          hintText: 'Email',
                          icon: Icons.email),
                      SizedBox(
                        height: Dimentions.height20,
                      ),
                      //your password
                      AppTextField(
                          textController: passwordController,
                          hintText: 'Password',
                          icon: Icons.password_sharp, isObscure: true),
                      SizedBox(
                        height: Dimentions.height20,
                      ),
                      //your name
                      AppTextField(
                          textController: nameController,
                          hintText: 'Name',
                          icon: Icons.person),
                      SizedBox(
                        height: Dimentions.height20,
                      ),
                      //your phone
                      AppTextField(
                          textController: phoneController,
                          hintText: 'Phone',
                          icon: Icons.phone),
                      SizedBox(
                        height: Dimentions.height20,
                      ),
                      //sign up button
                      GestureDetector(
                        onTap: () {
                          _registration(_authController);
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
                              text: 'Sign Up',
                              size: Dimentions.font20 + Dimentions.font20 / 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimentions.height10,
                      ),
                      //tag line
                      RichText(
                          text: TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.back(),
                              text: "Have an account already?",
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: Dimentions.font20,
                              ))),
                      SizedBox(
                        height: Dimentions.screenHeight * 0.05,
                      ),
                      //sign up options
                      RichText(
                          text: TextSpan(
                              // recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                              text:
                                  "Sign up using one of the following methods",
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: Dimentions.font20,
                              ))),
                      Wrap(
                          children: List.generate(
                              3,
                              (index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: Dimentions.radius30,
                                      backgroundImage: AssetImage(
                                        "assets/image/" + signUpImages[index],
                                      ),
                                    ),
                                  )))
                    ],
                  ),
                )
              :const CustomLoader(); 
        }));
  }
}
