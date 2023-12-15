import 'package:delivery/controllers/popular_product_controller.dart';
import 'package:delivery/controllers/recommended_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:delivery/pages/home/food_page_body.dart';
import 'package:delivery/utils/colors.dart';
import 'package:delivery/utils/dimentions.dart';
import 'package:delivery/widgets/big_text.dart';
import 'package:delivery/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
   Future<void> _loadResource() async {
   await Get.find<PopularProductController>().getPopularProductList();
    //to access controller toh till controller but agr jo list present h usme need to access tht particalar to complete writeup 
   await Get.find<RecommendedProductController>().getRecommendedProductList();
  }
  @override
  Widget build(BuildContext context) {
    //height of present screen
    // print("current height is " + MediaQuery.of(context).size.height.toString());
    return RefreshIndicator(
      onRefresh: _loadResource,
      child: Column(
        children: [
          Container( 
            //header
            child: Container(
              //margin
              margin: EdgeInsets.only(
                  top: Dimentions.height45,
                  bottom: Dimentions.height15 //no need of bottom ig
                  ),
              padding: EdgeInsets.only(
                  left: Dimentions.width20, right: Dimentions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    //by default top
                    children: [
                      BigText(
                        text: 'Bangladesh',
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              SmallText(
                                text: 'Abxcvdc',
                                color: Colors.black54,
                              ),
                              Icon(Icons.arrow_drop_down_rounded),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    //container has a property ki it is always placed a vertical center
                    width: Dimentions.height45,
                    height: Dimentions.height45,
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: Dimentions.iconSize24,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimentions.radius15),
                      color: AppColors.mainColor,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(child: SingleChildScrollView(child: FoodPageBody())),
          //since food page is scrollable except for header
        ],
      ),
    );
  }
}
