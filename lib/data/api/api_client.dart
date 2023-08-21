import 'dart:developer';

import 'package:delivery/utils/app_constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;

  late Map<String, String> _mainHeaders;

//header for talking to the server
  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = AppConstants.TOKEN;
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
  Future<Response> getData(
    String uri,
  ) async {
    try {
      //wait for the data and then return response
      Response response = await get(uri);
      log(response.body.toString());
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
      //printing error through status text
    }
  }
}
