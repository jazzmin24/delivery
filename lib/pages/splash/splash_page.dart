import 'dart:async';

import 'package:delivery/routes/route_helper.dart';
import 'package:delivery/utils/dimentions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

//  Future<void> _loadResource() async {
//    await Get.find<PopularProductController>().getPopularProductList();
//     //to access controller toh till controller but agr jo list present h usme need to access tht particalar to complete writeup
//    await Get.find<RecommendedProductController>().getRecommendedProductList();
//   }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_loadResource();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..forward(); //forward is used to apply/initialise transition
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(Duration(seconds: 3), () => Get.offNamed(RouteHelper.getInitial()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
              scale: animation,
              child: Center(
                  child: Image.asset(
                'assets/image/logo.jpg',
                width: Dimentions.splashImg,
              ))),
          //SizedBox(width: 5,),

          Text(
            'The Best Food',
            style: GoogleFonts.allura(
                fontSize: Dimentions.font26 * 2,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                color: Colors.black),
          ),
        ],
      ),
    );
  }
}
