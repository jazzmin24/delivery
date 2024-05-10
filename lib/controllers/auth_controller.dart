import 'dart:developer';

import 'package:delivery/data/repository/auth_repo.dart';
import 'package:delivery/models/response_model.dart';
import 'package:delivery/models/signup_body_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({
    required this.authRepo,
  });
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> registration(SignUpBody signUpBody) async {
    _isLoading = true;
    update();
    Response response = await authRepo.registration(signUpBody);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> login(String phone, String password) async {
    print("Getting token");
    print(await authRepo.getUserToken()); // Await the getUserToken() call
    _isLoading = true;
    update();

    Response response = await authRepo.login(phone, password);
    late ResponseModel responseModel;
    log(response.body.toString());
    if (response.statusCode == 200) {
      print("Backend Token");
      dynamic token = response.body["token"];
      if (token != null) {
        if (token != null) {
          authRepo.saveUserToken(token.toString());
          print(token.toString());
          responseModel = ResponseModel(true, token.toString());
        } else {
          // Handle the scenario where the token is not a String
          print("Invalid token format in the response");
          responseModel = ResponseModel(false, "Invalid token format");
        }
      } else {
        // Handle the scenario where the token is null
        print("Token not found in the response");
        responseModel = ResponseModel(false, "Token not found");
      }
    } else {
      print("Login Error: ${response.statusCode} - ${response.statusText}");
      responseModel = ResponseModel(false, response.statusText!);
    }

    _isLoading = false;
    update();
    return responseModel;
  }

  // Future<ResponseModel> login(String phone, String password) async {
  //   print("Getting token");
  //   print(await authRepo.getUserToken()); // Await the getUserToken() call
  //   _isLoading = true;
  //   update();

  //   Response response = await authRepo.login(phone, password);
  //   late ResponseModel responseModel;
  //   if (response.statusCode == 200) {
  //     print("Backend Token");
  //     String? token = response.body["token"] as String?;
  //     //log(token.toString());
  //     // if (token != null) {
  //     //   authRepo.saveUserToken(token);
  //     //   print(token);
  //     //   responseModel = ResponseModel(true, token);
  //     // } else {
  //     //   // Handle the scenario where the token is not present in the response
  //     //   print("Token not found in the response");
  //     //   responseModel = ResponseModel(false, "Token not found");
  //     // }
  //   } else {
  //     print("Login Error: ${response.statusCode} - ${response.statusText}");
  //     responseModel = ResponseModel(false, response.statusText!);
  //   }
  //   _isLoading = false;
  //   update();
  //   return responseModel;
  // }

  void saveUserNumberAndPassword(String number, String password) {
    authRepo.saveUserNumberAndPassword(number, password);
  }

  bool userLoggedIn() {
    return authRepo.userLoggedIn();
  }

  bool clearSharedData() {
   return authRepo.clearSharedData();
  }
}
