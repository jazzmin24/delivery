import 'package:delivery/controllers/cart_controller.dart';
import 'package:delivery/controllers/popular_product_controller.dart';
import 'package:delivery/pages/cart/cart_page.dart';
import 'package:delivery/pages/home/main_food_page.dart';
import 'package:delivery/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:delivery/utils/dimentions.dart';
import 'package:delivery/widgets/app_column.dart';
import 'package:delivery/widgets/app_icon.dart';
import 'package:delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';
import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  PopularFoodDetail({super.key, required this.pageId, required this.page});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    // print('page is id ' + pageId.toString());
    //print('product name is ' + product.name.toString());
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>()); //sets data to zero

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
              left: 0, //mention nhi bhi krra toh bhi it remains same
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimentions.popularFoodImgSize,
                color: const Color.fromARGB(255, 251, 220, 127),
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //     fit: BoxFit.cover,
                //     image: NetworkImage(
                //       AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!
                //     )
                //    ),
                // ),
              )),
          //icon widgets
          Positioned(
              height: Dimentions.height45,
              left: Dimentions.width20,
              right: Dimentions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        if (page == 'cartpage') {
                          Get.toNamed(RouteHelper.getCartPage());
                        } else {
                          Get.toNamed(RouteHelper.getInitial());
                        }
                      },
                      child: AppIcon(icon: Icons.arrow_back_ios)),
                  GetBuilder<PopularProductController>(builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        print('tapped here');
                        if (controller.totalItems >= 1)
                          Get.toNamed(RouteHelper.getCartPage());
                      },
                      child: Stack(
                        children: [
                          AppIcon(icon: Icons.shopping_cart_outlined),
                          controller.totalItems >= 1
                              ? Positioned(
                                  top: 0,
                                  right: 0,
                                  child: AppIcon(
                                    icon: Icons.circle,
                                    size: 20,
                                    iconColor: Colors.transparent,
                                    backgroundColor: AppColors.mainColor,
                                  ),
                                )
                              : Container(),
                          Get.find<PopularProductController>().totalItems >= 1
                              ? Positioned(
                                  top: 3,
                                  right: 3,
                                  child: BigText(
                                    text: Get.find<PopularProductController>()
                                        .totalItems
                                        .toString(),
                                    size: 12,
                                    color: Colors.white,
                                  ))
                              : Container()
                        ],
                      ),
                    );
                  })
                ],
              )),
          //introduction of food
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimentions.popularFoodImgSize - 20,
              child: Container(
                  padding: EdgeInsets.only(
                      left: Dimentions.width20,
                      right: Dimentions.width20,
                      top: Dimentions.height20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimentions.radius20),
                      topLeft: Radius.circular(Dimentions.radius20),
                    ),
                    //---------->>>>>>>>>>>>
                    // color: Colors.blue
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(
                        text: product.name!,
                      ),
                      SizedBox(
                        height: Dimentions.height20,
                      ),
                      BigText(text: 'Introduce'),
                      SizedBox(
                        height: Dimentions.height20,
                      ),
                      //expandable text widget
                      Expanded(
                          child: SingleChildScrollView(
                              child: ExpandableTextWidget(
                                  text: product.description!)))
                    ],
                  )))
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (popularProduct) {
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
          child: Row(
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
                  borderRadius: BorderRadius.circular(Dimentions.radius20),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        popularProduct.setQuantity(false);
                      },
                      child: Icon(
                        Icons.remove,
                        color: AppColors.signColor,
                      ),
                    ),
                    SizedBox(
                      width: Dimentions.widtht10 / 2,
                    ),
                    BigText(text: popularProduct.inCartItems.toString()),
                    SizedBox(
                      width: Dimentions.widtht10 / 2,
                    ),
                    GestureDetector(
                      onTap: () {
                        popularProduct.setQuantity(true);
                      },
                      child: Icon(
                        Icons.add,
                        color: AppColors.signColor,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  popularProduct.addItem(product);
                },
                child: Container(
                  padding: EdgeInsets.only(
                    top: Dimentions.height20,
                    bottom: Dimentions.height20,
                    left: Dimentions.width20,
                    right: Dimentions.width20,
                  ),
                  child: BigText(
                    text: '\$ ${product.price!} | Add to cart',
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimentions.radius20),
                    color: AppColors.mainColor,
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
