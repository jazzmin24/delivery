import 'package:flutter/material.dart';
import 'package:delivery/utils/colors.dart';
import 'package:delivery/utils/dimentions.dart';
import 'package:delivery/widgets/app_icon.dart';
import 'package:delivery/widgets/big_text.dart';
import 'package:delivery/widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        //A CustomScrollView lets you supply slivers directly to create various scrolling effects, such as lists, grids, and expanding headers. For example, to create a scroll view that contains an expanding app bar followed by a list and a grid, use a list of three slivers:
        slivers: [
          //special effect like on scrolling image dissapears
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
                //yellow screen height after scrolling
                preferredSize: Size.fromHeight(20),
                child: Container(
                  child: Center(
                    child:
                        BigText(size: Dimentions.font26, text: 'Chinese Side'),
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
                background: Image.asset(
              'assets/image/food.jpg',
              width: double.maxFinite,
              fit: BoxFit.cover,
            )),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: Dimentions.width20, right: Dimentions.width20),
                  child: ExpandableTextWidget(
                      text:
                          'Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice.Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice.Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh corianderChicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice.Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice.Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice.Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice.Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice.Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yogurt is placed in a large pot , then layered with fried onions , fresh coriander  '),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
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
                AppIcon(
                  iconSize: Dimentions.iconSize24,
                  icon: Icons.remove,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                ),
                BigText(
                  text: '\$12.88' +
                      ' X ' +
                      '0', //split string so tht in future they can be dynamic
                  color: AppColors.mainBlackColor,
                  size: Dimentions.font26,
                ),
                AppIcon(
                  iconSize: Dimentions.iconSize24,
                  icon: Icons.add,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
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
                    borderRadius: BorderRadius.circular(Dimentions.radius20),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
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
        ],
      ),
    );
  }
}
//                margin: EdgeInsets.only(left: Dimentions.width20,right:Dimentions.width20 ),
