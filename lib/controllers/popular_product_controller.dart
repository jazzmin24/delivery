import 'package:delivery/data/repository/popular_product_repo.dart';
import 'package:delivery/models/products_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList =
      []; //underscore vali list are private variables
  //this list would return data recieved from the repositiry

  List<dynamic> get popularProductList => _popularProductList;

  //creating method
  Future<void> getPopularProductList() async {
    //since return type is future need to take async modifier
    Response response = await popularProductRepo
        .getPopularProductList(); //since getPopularProoduct method is inside popularProduct repository
    // ye reponse m save hoja ga data
    //await is used to wait until we get the data
    if (response.statusCode == 200) {
      //statuscode==200 impliess data is recieved sucessfully

      print('got products');
      _popularProductList = []; //save it in list

      //_popularProductList.addAll(Product.fromJson(response.body).products);
      //model is necessary taaki koi bhi change kra agr to bs sirf model m chnge krta hi saari list maps aur json m automatically chnge hoja hr jgha ek ek baar krka na krna pda

      //now---->> we recieve json type data need to convert it in  model
      //for now keeping these brackets empty
      print(_popularProductList);
      update();
      //this update is more like set state
    } else {
      //in case fail ho jata h i.e. unable to revieve data to kya krenge
    }
  }
}
