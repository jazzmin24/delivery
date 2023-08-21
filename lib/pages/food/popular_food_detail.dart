import 'package:flutter/material.dart';
import 'package:delivery/utils/dimentions.dart';
import 'package:delivery/widgets/app_column.dart';
import 'package:delivery/widgets/app_icon.dart';
import 'package:delivery/widgets/expandable_text_widget.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
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
                //     image: AssetImage(
                //       ''
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
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart_outlined),
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
                        text: 'Chinese Side',
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
                                  text:
                                      'Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice.Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander ')))
                    ],
                  )))
        ],
      ),
      bottomNavigationBar: Container(
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
                borderRadius: BorderRadius.circular(Dimentions.radius20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: Dimentions.widtht10 / 2,
                  ),
                  BigText(text: '0'),
                  SizedBox(
                    width: Dimentions.widtht10 / 2,
                  ),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: Dimentions.height20,
                bottom: Dimentions.height20,
                left: Dimentions.width20,
                right: Dimentions.width20,
              ),
              child: BigText(
                text: '\$10 | Add to cart',
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimentions.radius20),
                color: AppColors.mainColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
