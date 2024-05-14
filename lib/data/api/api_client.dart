import 'dart:developer';
import 'package:delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  // late SharedPreferences sharedPreferences;

  late Map<String, String> _mainHeaders;

//header for talking to the server
  ApiClient({
    required this.appBaseUrl,
   //  required this.sharedPreferences
  }) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = 
  //sharedPreferences.getString(AppConstants.TOKEN)!;
AppConstants.TOKEN;
    
    _mainHeaders = {
      //for asking json data
      'Content-type':
          'application/json; charset=UTF-8', //charset for decoding and ending most of the tym no such need
      'Authorization':
          'Bearer $token' //in case u make a lot of post requests u should have token from your device to server
      //bearer is token type used for authentication
    };
  }
  //url hoga braces m

  void updateHeader(String token) {
    _mainHeaders = {
      //for asking json data
      'Content-type':
          'application/json; charset=UTF-8', //charset for decoding and ending most of the tym no such need
      'Authorization':
          'Bearer $token' //in case u make a lot of post requests u should have token from your device to server
      //bearer is token type used for authentication
    };
  }

  Future<Response> getData(String uri,
      {Map<String, String>? headers} //i.e. making this optional
      ) async {
    try {
      //wait for the data and then return response
      Response response = await get(uri, headers: headers ?? _mainHeaders);

      log(response.body.toString());
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
      //printing error through status text
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    print(body.toString());
    try {
      Response response = await post(uri, body, headers: _mainHeaders);
      log("inside post data");
      log(uri);
      log(response.statusCode.toString());
      log(response.body.toString());

      // Parse the JSON response
      //Map<String, dynamic> responseData = json.decode(response.body);

      // Access the values from the parsed response
      var phone = response.body['phone'];
      var token = response.body['token'];
      var isPhoneVerified = response.body['is_phone_verified'];

      // Print the values
      log('Phone: $phone');
      log('Token: $token');
      log('Is Phone Verified: $isPhoneVerified');

      return response;
    } catch (e) {
      log(e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
  //   print(body.toString());
  //   try {
  //     Response response = await post(uri, body, headers: _mainHeaders);
  //     log("inside post data");
  //     log(uri);
  //     log(response.statusCode.toString());
  //     log(response.body.toString());
  //     log(response.body["token"].toString());
  //     return response;
  //   } catch (e) {
  //     log(e.toString());
  //     return Response(statusCode: 1, statusText: e.toString());
  //   }
  // }
}
