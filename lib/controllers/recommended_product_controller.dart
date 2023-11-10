//import 'package:delivery/data/repository/popular_product_repo.dart';
import 'package:delivery/models/products_model.dart';
import 'package:get/get.dart';

import '../data/repository/recommended_product_repo.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  List<dynamic> _recommendedProductList =[]; 
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false; 
  bool get isLoaded =>
      _isLoaded; 
  Future<void> getRecommendedProductList() async {
    
    Response response = await recommendedProductRepo
        .getRecommendedProductList(); 
    if (response.statusCode == 200) {
      print('got products recommeneded');
      _recommendedProductList = [];
         _recommendedProductList
          .addAll(Product.fromJson(response.body).products as Iterable);
     
      _isLoaded = true;
      update();
     
    } else {
      print('could not get products recommeneded');
      //in case fail ho jata h i.e. unable to revieve data to kya krenge
    }
  }
}
