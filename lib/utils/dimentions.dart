import 'package:get/get.dart';

//getx not only helps in state management but plays important role in adjusting
//widgets to screen size
class Dimentions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  static double pageView =
      screenHeight / 2.64; //parent container proportion 781.1/320=2.64
  static double pageViewContainer = screenHeight / 3.84;
  //781.1/220=? some factor ki device k according is proportion m honi chaiya heiht page view vala widget ki
  static double pageViewTextContainer = screenHeight / 7.03;

  //dynamic height for padding and margin
  static double height10 = screenHeight / 84.4;
  static double height20 = screenHeight / 42.2;
  static double height15 = screenHeight / 56.27;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.76;
  //static double height120 = screenHeight / ;

  //dynamic width for padding and margin
  static double widtht10 = screenHeight / 84.4;
  static double width20 = screenHeight / 42.2;
  static double width15 = screenHeight / 56.27;
  static double width30 = screenHeight / 28.13;
  //static double width120 = screenHeight / ;

  //optimising font size
  static double font16 = screenHeight / 52.75;
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.46;

//radius
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  //icon
  static double iconSize24 = screenHeight / 35.17;
  static double iconSize16 = screenHeight / 52.75;
 

  //list view size
  static double listViewImgSize = screenWidth / 3.25; //390/120=3.25
  static double listViewTextContSize = screenWidth / 3.9; //390/100=3.9

  //popular food
  static double popularFoodImgSize = screenHeight / 2.41; //screenheight/350

  //bottom height
  static double bottomHeightBar = screenHeight / 7.03;
}

//adjusting size dynamically in order to prevent overflow
