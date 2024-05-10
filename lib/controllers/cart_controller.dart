import 'package:delivery/data/repository/cart_repo.dart';
import 'package:delivery/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/cart_model.dart';
import '../utils/colors.dart';

//cart model bhi toh jo jo chiza cart m jayengi keeps record
class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModel> _items = {};
  //cart model is for saving the items
  Map<int, CartModel> get items => _items;
  List<CartModel> storageItems = []; //only for storage and SharedPreferences

//jo bhi chiza add hui h vo directly cart m j aya
  void addItem(ProductModel product, int quatity) {
    var totalQuantity = 0;
    // print('length of the item is' + _items.length.toString());
    if (_items.containsKey(product.id!)) {
      //is item is already present
      _items.update(product.id!, (value) {
        //value is object here
        totalQuantity = value.quantity! + quatity;
        return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            quantity: value.quantity! + quatity, //for updating the quantity
            isExist: true,
            time: DateTime.now().toString(),
            product: product);
      });
      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      if (quatity > 0) {
        _items.putIfAbsent(product.id!, () {
          // print('adding item to cart id ' +
          //     product.id!.toString() +
          //     'quantity' +
          //     quatity.toString());

          // _items.forEach((key, value) {
          //   print('quantity is ' + value.quantity.toString());
          //   //this prints previous quantity which is added to cart
          // });

          return CartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            quantity: quatity,
            //now these three doesnt exist in product model only exist in cart and product controller
            isExist: true,
            time: DateTime.now().toString(),
            product: product,
          );
        });
      } else {
        Get.snackbar(
            "Item count", "You should add atleast one item in the cart !",
            backgroundColor: AppColors.mainColor, colorText: Colors.white);
      }
    }
    cartRepo.addToCartList(getItems);
    update();
  }

  bool existInCart(ProductModel product) {
    //jb bhi vapis se app khola toh null ho jaya cart
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

//getter, it returns a field not functin
  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  int get totalAmount {
    var total = 0;
    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });
    return total;
  }

  List<CartModel> getCartData() {
    setCart = cartRepo.getCartList();
    return storageItems;
  }

  set setCart(List<CartModel> items) {
    storageItems = items;
    for (int i = 0; i < storageItems.length; i++) {
      _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
    }
  }

  void addToHistory() {
    cartRepo.addToCartHistoryList();
    clear();
  }

  void clear() {
    _items = {};
    update();
  }

  List<CartModel> getCartHistoryList() {
    return cartRepo.getCartHistoryList();
  }

  set setItems(Map<int, CartModel> setItems) {
    _items = {};
    _items = setItems;
  }

  void addToCartList() {
    cartRepo.addToCartList(getItems);
    update();
  }

  void clearCartHistory() {
    cartRepo.clearCartHistory();
    update();
  }
}
