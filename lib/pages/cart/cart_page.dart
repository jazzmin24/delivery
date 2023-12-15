import 'package:delivery/base/no_data_page.dart';
import 'package:delivery/controllers/auth_controller.dart';
import 'package:delivery/controllers/cart_controller.dart';
import 'package:delivery/controllers/popular_product_controller.dart';
import 'package:delivery/controllers/recommended_product_controller.dart';
import 'package:delivery/pages/home/main_food_page.dart';
import 'package:delivery/utils/app_constants.dart';
import 'package:delivery/utils/colors.dart';
import 'package:delivery/utils/dimentions.dart';
import 'package:delivery/widgets/app_icon.dart';
import 'package:delivery/widgets/big_text.dart';
import 'package:delivery/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //header
          Positioned(
              top: Dimentions.height20 * 3,
              left: Dimentions.width20,
              right: Dimentions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimentions.iconSize24,
                  ),
                  SizedBox(
                    width: Dimentions.width20 * 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimentions.iconSize24,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimentions.iconSize24,
                  ),
                ],
              )),
          //body
          GetBuilder<CartController>(builder: (_cartController) {
            return _cartController.getItems.length > 0
                ? Positioned(
                    top: Dimentions.height20 * 5,
                    left: Dimentions.width20,
                    right: Dimentions.width20,
                    bottom: 0,
                    child: Container(
                      margin: EdgeInsets.only(top: Dimentions.height15),
                      //color: Colors.red,
                      child: MediaQuery.removePadding(
                          //but we dont need this kyuki bina iska bhi top se start hora no unwanted space
                          context: context,
                          removeTop: true,
                          child: GetBuilder<CartController>(
                            builder: (cartController) {
                              var _cartList = cartController.getItems;
                              return ListView.builder(
                                  itemCount: _cartList.length,
                                  itemBuilder: (_, index) {
                                    return Container(
                                      height: Dimentions.height20 * 5,
                                      width: double.maxFinite,
                                      //color: Colors.blue,
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              var popularIndex = Get.find<
                                                      PopularProductController>()
                                                  .popularProductList
                                                  .indexOf(_cartList[index]
                                                      .product!);
                                              if (popularIndex >= 0) {
                                                Get.toNamed(
                                                    RouteHelper.getPopularFood(
                                                        popularIndex,
                                                        "cartpage"));
                                              } else {
                                                var recommendedIndex = Get.find<
                                                        RecommendedProductController>()
                                                    .recommendedProductList
                                                    .indexOf(_cartList[index]
                                                        .product!);
                                                if (recommendedIndex < 0) {
                                                  Get.snackbar(
                                                      "History Product",
                                                      "Product review is not available for history products!",
                                                      backgroundColor:
                                                          AppColors.mainColor,
                                                      colorText: Colors.white);
                                                } else {
                                                  Get.toNamed(RouteHelper
                                                      .getRecommendedFood(
                                                          recommendedIndex,
                                                          "cartpage"));
                                                }
                                              }
                                            },
                                            child: Container(
                                              height: Dimentions.height20 * 5,
                                              width: Dimentions.height20 * 5,
                                              margin: EdgeInsets.only(
                                                  bottom: Dimentions.height10),
                                              decoration: BoxDecoration(
                                                // image: DecorationImage(
                                                //     fit: BoxFit.cover,
                                                //     image: NetworkImage(
                                                //       AppConstants.BASE_URL+AppConstants.UPLOAD_URL+cartController.getItems[index].img!
                                                //     )
                                                //     ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimentions.radius20),
                                                color: Color.fromARGB(
                                                    255, 219, 156, 191),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: Dimentions.widtht10,
                                          ),
                                          Expanded(
                                              child: Container(
                                            height: Dimentions.height20 * 5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                BigText(
                                                  text: cartController
                                                      .getItems[index].name!,
                                                  color: Colors.black54,
                                                ),
                                                SmallText(text: 'Spicy'),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    BigText(
                                                        text: cartController
                                                            .getItems[index]
                                                            .price
                                                            .toString(),
                                                        color:
                                                            Colors.redAccent),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                        top:
                                                            Dimentions.height10,
                                                        bottom:
                                                            Dimentions.height10,
                                                        left:
                                                            Dimentions.widtht10,
                                                        right:
                                                            Dimentions.widtht10,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                Dimentions
                                                                    .radius20),
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              print('tapped');
                                                              cartController.addItem(
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                                  -1);
                                                            },
                                                            child: Icon(
                                                              Icons.remove,
                                                              color: AppColors
                                                                  .signColor,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: Dimentions
                                                                    .widtht10 /
                                                                2,
                                                          ),
                                                          BigText(
                                                              text: _cartList[
                                                                      index]
                                                                  .quantity
                                                                  .toString()),
                                                          SizedBox(
                                                            width: Dimentions
                                                                    .widtht10 /
                                                                2,
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              print('tapped');
                                                              cartController.addItem(
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                                  1);
                                                            },
                                                            child: Icon(
                                                              Icons.add,
                                                              color: AppColors
                                                                  .signColor,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ))
                                        ],
                                      ),
                                    );
                                  });
                            },
                          )),
                    ))
                : NoDataPage(text: 'Your cart is empty!');
          })
        ],
      ),
      bottomNavigationBar:
          GetBuilder<CartController>(builder: (cartController) {
        return Container(
          height: Dimentions.bottomHeightBar,
          padding: EdgeInsets.only(
              top: Dimentions.height30,
              bottom: Dimentions.height30,
              left: Dimentions.width20,
              right: Dimentions.width20),
          decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimentions.radius20 * 2),
              topRight: Radius.circular(Dimentions.radius20 * 2),
            ),
          ),
          child: cartController.getItems.length > 0
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: Dimentions.height20,
                        bottom: Dimentions.height20,
                        left: Dimentions.width20,
                        right: Dimentions.width20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimentions.radius20),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: Dimentions.widtht10 / 2,
                          ),
                          BigText(
                              text:
                                  '\$' + cartController.totalAmount.toString()),
                          SizedBox(
                            width: Dimentions.widtht10 / 2,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (Get.find<AuthController>().userLoggedIn()) {
                          print('tapped');
                          cartController.addToHistory();
                        } 
                        else {
                          Get.toNamed(RouteHelper.getSignInPage());
                        }
                        //  popularProduct.addItem(product);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          top: Dimentions.height20,
                          bottom: Dimentions.height20,
                          left: Dimentions.width20,
                          right: Dimentions.width20,
                        ),
                        child: BigText(
                          text: 'Check out',
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimentions.radius20),
                          color: AppColors.mainColor,
                        ),
                      ),
                    )
                  ],
                )
              : Container(),
        );
      }),
    );
  }
}
