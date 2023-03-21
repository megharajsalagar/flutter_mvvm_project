import 'dart:convert';
import 'dart:io';

import 'package:mvvm_project/data/network/base_api.dart';
import 'package:http/http.dart' as http;
class NetworkApiServices extends BaseApi {

  @override
  Future<dynamic> getGetApiResponse(String url) async{
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = responseJson(response);
    }on SocketException{
      throw Exception('No Internet');
    };
    
  }

  @override
  Future<dynamic> getPostApiResponse(String url,dynamic data) async{

    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url),body:data);
      responseJson = returnResponse(response);
    } on SocketException{
      throw Exception("No internet connection");
    }
    return responseJson;
  }
  
  dynamic returnResponse(http.Response response){

    switch (response.statusCode) {
      case 200:
          dynamic responseJson = jsonDecode(response.body);
          print("Success:  ${jsonDecode(response.body)}");
          return responseJson;
      case 400: 
      default:
    }
  }
}