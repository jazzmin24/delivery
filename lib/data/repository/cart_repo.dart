import 'dart:convert';

import 'package:delivery/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList) {
    // sharedPreferences.remove(AppConstants.CART_LIST);
    // sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);
    var time = DateTime.now().toString();
    cart = [];
    //convert obj. to string since sharedpreferences only accepts strings
    // cartList.forEach((element) {
    //   return cart.add(jsonEncode(element));
    // });
//both the ways are correct
    cartList.forEach((element) {
      cart.add(jsonEncode(element));
      element.time = time;
    });

    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    //print(sharedPreferences.getStringList(AppConstants.CART_LIST));
    getCartList();
  }

  List<CartModel> getCartList() {
//if key exists then get data
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      print('inside getCartList' + carts.toString());
    }
    List<CartModel> cartList = [];

    // carts.forEach((element) {
    //   cartList.add(CartModel.fromJson(jsonDecode(element)));        //converting to object
    // });
    carts.forEach((element) => cartList.add(CartModel.fromJson(
        jsonDecode(element)))); //both arr same above mentioned or this
    return cartList;
  }

//for saving details here in cart
  List<CartModel> getCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)) {
      cartHistory = [];
      cartHistory =
          sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    List<CartModel> cartListHistory = [];
    cartHistory.forEach((element) =>
        cartListHistory.add(CartModel.fromJson(jsonDecode(element))));
    return cartListHistory;
  }

  void addToCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)) {
      cartHistory =
          sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    for (int i = 0; i < cart.length; i++) {
      print('history list ' + cart[i]);
      cartHistory.add(cart[i]);
    }
    removeCart();
    sharedPreferences.setStringList(
        AppConstants.CART_HISTORY_LIST, cartHistory);
    print('The length of history list is ' +
        getCartHistoryList().length.toString());
    for (int j = 0; j < getCartHistoryList().length; j++) {
      print('The time for the order is ' +
          getCartHistoryList()[0].time.toString());
    }
  }

  void removeCart() {
    cart = [];
    sharedPreferences.remove(AppConstants.CART_LIST);
  }

  void clearCartHistory() {
    removeCart();
    cartHistory = [];
    sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);
  }
}
