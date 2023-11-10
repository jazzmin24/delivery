import 'package:delivery/controllers/popular_product_controller.dart';
import 'package:delivery/controllers/recommended_product_controller.dart';
import 'package:delivery/pages/cart/cart_page.dart';
import 'package:delivery/routes/route_helper.dart';
import 'package:delivery/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:delivery/utils/colors.dart';
import 'package:delivery/utils/dimentions.dart';
import 'package:delivery/widgets/app_icon.dart';
import 'package:delivery/widgets/big_text.dart';
import 'package:delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import '../../controllers/cart_controller.dart';

class RecommendedFoodDetail extends StatelessWidget {
  int pageId;
  final String page;
  RecommendedFoodDetail({super.key, required this.pageId, required this.page});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>().initProduct(
        product, Get.find<CartController>()); //in order to initialise cart
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          //A CustomScrollView lets you supply slivers directly to create various scrolling effects, such as lists, grids, and expanding headers. For example, to create a scroll view that contains an expanding app bar followed by a list and a grid, use a list of three slivers:
          slivers: [
            //special effect like on scrolling image dissapears
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 70,
              title: Row(
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
                      child: AppIcon(icon: Icons.clear)),
                  //AppIcon(icon: Icons.shopping_cart_outlined)
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
                          Get.find<PopularProductController>().totalItems >= 1
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
              ),
              bottom: PreferredSize(
                  //yellow screen height after scrolling
                  preferredSize: Size.fromHeight(20),
                  child: Container(
                    child: Center(
                      child:
                          BigText(size: Dimentions.font26, text: product.name!),
                    ),
                    width: double.maxFinite,
                    padding: EdgeInsets.only(top: 5, bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimentions.radius20),
                            topRight: Radius.circular(Dimentions.radius20))),
                  )),
              pinned: true,
              backgroundColor: AppColors.yellowColor,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                  background: 
                  Image.asset(
                'assets/image/food.jpg',
                width: double.maxFinite,
                fit: BoxFit.cover,
              )
                  // Image.network(
                  //   AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!,
                  //   width: double.maxFinite,
                  //   fit: BoxFit.cover,
                  // )
                  ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimentions.width20, right: Dimentions.width20),
                    child: ExpandableTextWidget(
                      text: product.description!,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar:
            GetBuilder<PopularProductController>(builder: (controller) {
          return Column(
            //ab asa toh ye text jaara top pe so ab le jao isa bottom m
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: Dimentions.width20 * 2.5,
                    right: Dimentions.width20 * 2.5,
                    top: Dimentions.height10,
                    bottom: Dimentions.height10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(false);
                        print('I am tapped');
                      },
                      child: AppIcon(
                        iconSize: Dimentions.iconSize24,
                        icon: Icons.remove,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                      ),
                    ),
                    BigText(
                      text: '\$ ${product.price!} X ${controller.inCartItems} ',
                      // ' X ' +
                      //  '0', //split string so tht in future they can be dynamic
                      color: AppColors.mainBlackColor,
                      size: Dimentions.font26,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(true);
                      },
                      child: AppIcon(
                        iconSize: Dimentions.iconSize24,
                        icon: Icons.add,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.mainColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.addItem(product);
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
                          borderRadius:
                              BorderRadius.circular(Dimentions.radius20),
                          color: AppColors.mainColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
//                margin: EdgeInsets.only(left: Dimentions.width20,right:Dimentions.width20 ),
