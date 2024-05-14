import 'package:delivery/controllers/cart_controller.dart';
import 'package:delivery/controllers/popular_product_controller.dart';
import 'package:delivery/controllers/recommended_product_controller.dart';
import 'package:delivery/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //to initialise
  await dep.init(); //way to load dependencies
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    //to access controller toh till controller but agr jo list present h usme need to access tht particalar to complete writeup
    Get.find<RecommendedProductController>().getRecommendedProductList();
    Get.find<CartController>().getCartData();
    // return GetBuilder<PopularProductController>(builder: (_) {      //since without builder delete hora tha memory se ye
    //   return GetBuilder<PopularProductController>(builder: (_) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SignInPage(),
      initialRoute: RouteHelper.getSplashPage(),
      getPages: RouteHelper.routes,
    );
    //   });
    // });
  }
}
