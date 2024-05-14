import 'dart:developer';

import 'package:delivery/base/custom_loader.dart';
import 'package:delivery/controllers/auth_controller.dart';
import 'package:delivery/controllers/cart_controller.dart';
import 'package:delivery/controllers/user_controller.dart';
import 'package:delivery/routes/route_helper.dart';
import 'package:delivery/utils/colors.dart';
import 'package:delivery/utils/dimentions.dart';
import 'package:delivery/widgets/account_widget.dart';
import 'package:delivery/widgets/app_icon.dart';
import 'package:delivery/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
      log("User has logged in");
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: BigText(
            text: "Profile",
            size: 24,
            color: Colors.white,
          ),
        ),
        body: GetBuilder<UserController>(builder: (userController) {
          log(userController.isLoading
              ? userController.userModel.name
              : "hjsdfgj");
          //  log(userController.userModel.email);
          return _userLoggedIn
              ? (userController.isLoading
                  ? Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(top: Dimentions.height20),
                      child: Column(
                        children: [
                          //profile icon
                          AppIcon(
                            icon: Icons.person,
                            backgroundColor: AppColors.mainColor,
                            iconColor: Colors.white,
                            iconSize: Dimentions.height45 + Dimentions.height30,
                            size: Dimentions.height15 * 10,
                          ),
                          SizedBox(
                            height: Dimentions.height30,
                          ),

                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  //name
                                  AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.person,
                                        backgroundColor: AppColors.yellowColor,
                                        iconColor: Colors.white,
                                        iconSize: Dimentions.height10 * 5 / 2,
                                        size: Dimentions.height10 * 5,
                                      ),
                                      bigText: BigText(
                                          text: userController.userModel.name)),
                                  SizedBox(
                                    height: Dimentions.height30,
                                  ),
                                  //phone
                                  AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.phone,
                                        backgroundColor: AppColors.yellowColor,
                                        iconColor: Colors.white,
                                        iconSize: Dimentions.height10 * 5 / 2,
                                        size: Dimentions.height10 * 5,
                                      ),
                                      bigText: BigText(
                                          text:
                                              userController.userModel.phone)),
                                  SizedBox(
                                    height: Dimentions.height30,
                                  ),
                                  //email
                                  AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.email,
                                        backgroundColor: AppColors.yellowColor,
                                        iconColor: Colors.white,
                                        iconSize: Dimentions.height10 * 5 / 2,
                                        size: Dimentions.height10 * 5,
                                      ),
                                      bigText: BigText(
                                          text:
                                              userController.userModel.email)),
                                  SizedBox(
                                    height: Dimentions.height30,
                                  ),
                                  //address
                                  AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.location_on,
                                        backgroundColor: AppColors.yellowColor,
                                        iconColor: Colors.white,
                                        iconSize: Dimentions.height10 * 5 / 2,
                                        size: Dimentions.height10 * 5,
                                      ),
                                      bigText: BigText(text: 'XYZ')),
                                  SizedBox(
                                    height: Dimentions.height30,
                                  ),
                                  //message
                                  AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.message_outlined,
                                        backgroundColor: Colors.redAccent,
                                        iconColor: Colors.white,
                                        iconSize: Dimentions.height10 * 5 / 2,
                                        size: Dimentions.height10 * 5,
                                      ),
                                      bigText: BigText(text: 'Check messages')),
                                  SizedBox(
                                    height: Dimentions.height30,
                                  ),
                                  //log out
                                  GestureDetector(
                                    onTap: () {
                                      if (Get.find<AuthController>()
                                          .userLoggedIn()) {
                                        Get.find<AuthController>()
                                            .clearSharedData();
                                        Get.find<CartController>().clear();
                                        Get.find<CartController>()
                                            .clearCartHistory();
                                        Get.offNamed(
                                            RouteHelper.getSignInPage());
                                      } else {
                                        log('You logged out!');
                                      }
                                    },
                                    child: AccountWidget(
                                        appIcon: AppIcon(
                                          icon: Icons.logout,
                                          backgroundColor: Colors.redAccent,
                                          iconColor: Colors.white,
                                          iconSize: Dimentions.height10 * 5 / 2,
                                          size: Dimentions.height10 * 5,
                                        ),
                                        bigText: BigText(text: 'Logout')),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : const CustomLoader())
              : Center(
                  child: GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getSignInPage());
                  },
                  child: Container(
                    width: double.maxFinite,
                    height: Dimentions.height20 * 5,
                    margin: EdgeInsets.only(
                      left: Dimentions.width20,
                      right: Dimentions.width20,
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius:
                            BorderRadius.circular(Dimentions.radius20)),
                    child: Center(
                      child: BigText(
                        text: 'Sign In',
                        color: Colors.white,
                        size: Dimentions.font26,
                      ),
                    ),
                  ),
                )
                  //Text("You must login"),
                  );
        }));
  }
}
