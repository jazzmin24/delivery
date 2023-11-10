import 'package:delivery/controllers/cart_controller.dart';
import 'package:delivery/data/repository/popular_product_repo.dart';
import 'package:delivery/models/products_model.dart';
import 'package:delivery/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/cart_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList =
      []; //underscore vali list are private variables
  //this list would return data recieved from the repositiry
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded =>
      _isLoaded; //controller for loading images jb tk vo server se aati h
  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;   //total items added from all different pages

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

      _popularProductList
          .addAll(Product.fromJson(response.body).products as Iterable);
      //model is necessary taaki koi bhi change kra agr to bs sirf model m chnge krta hi saari list maps aur json m automatically chnge hoja hr jgha ek ek baar krka na krna pda

      //now---->> we recieve json type data need to convert it in  model
      //for now keeping these brackets empty
      // print(_popularProductList);
      _isLoaded = true;
      update();
      //this update is more like set state
    } else {
      //in case fail ho jata h i.e. unable to revieve data to kya krenge
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      print('increment ' + _quantity.toString());
      _quantity = checkQuantity(_quantity + 1);
    } else {
      print('decrement ' + _quantity.toString());
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar('Item count', "You can't reduce more !",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar('Item count', "You can't add more !",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

//set data suppose initially it is 4 to vapis se back krte hi it wont chnge implies tht state is saved
  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    //get from storage _inCartItems
    var exist = false;
    exist = cart.existInCart(product);
    print('Exist or not ' + exist.toString());
    if (exist) {
      _inCartItems = cart.getQuantity(product);
    }
    print('The quantity in the cart is ' + _inCartItems.toString());
  }

  void addItem(ProductModel product) {
    //if (quantity > 0) {
    //since agr quantity zero hi h to bhi jb add to cart pr click krra tha add hori thi 0 item bhi cart m
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {
      print('The id is ' +
          value.id.toString() +
          ' The quantity is ' +
          value.quantity.toString());
    });
    // } else {
    //   Get.snackbar(
    //       "Item count", "You should add atleast one item in the cart !",
    //       backgroundColor: AppColors.mainColor, colorText: Colors.white);
    // }
    update();  //updating ui
  }

  int get totalItems {
    //cart instance
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
