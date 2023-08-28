 import 'package:delivery/utils/app_constants.dart';
import 'package:delivery/data/api/api_client.dart';
//import 'package:delivery/utils/app_constants.dart';
import 'package:get/get.dart';

//repos talk to api client using internet connection there takes more time
//while loading data from internet get services are required
class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  //repo should have access to api client in order to call method tht lives insides api
  PopularProductRepo({required this.apiClient});
//constructor

  Future<Response> getPopularProductList() async {
//an empty method is created of future type which sends response from the server
    //phla api call krega fir kuch return krega
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}
