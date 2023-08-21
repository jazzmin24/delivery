import 'package:delivery/controllers/popular_product_controller.dart';
import 'package:delivery/data/api/api_client.dart';
import 'package:delivery/data/repository/popular_product_repo.dart';
import 'package:delivery/utils/app_constants.dart';
import 'package:get/get.dart';

//for loading all the dependencies
Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants
          .BASE_URL)); //Get.put() will put immediately   Get.lazyPut() will put when you need it
//now it is a consturctor and takes data check in the api_client.dart file

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find())); //getx will find

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
