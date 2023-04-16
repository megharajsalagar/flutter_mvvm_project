import 'dart:convert';
import 'dart:io';

import 'package:mvvm_project/data/network/base_api.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm_project/data/response/api_status.dart';

class NetworkApiServices extends BaseApi {
  @override
  Future<dynamic> getGetApiResponse(
      {required String endpoint, Map<String, dynamic>? query}) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(endpoint)).timeout(Duration(seconds: 10));
      responseJson = responseJson(response);
    } on SocketException {
      throw Exception('No Internet');
    }
    ;
  }

  @override
  Future<dynamic> getPostApiResponse(
      {required String endpoint, Map<String, dynamic>? body}) async {
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(endpoint),
          body: jsonEncode(body),
          headers: <String, String>{
            "Content-Type": "application/json",
            "Accept": "*/*",
            "Access-Control-Allow-Original": "*"
          });
      responseJson = returnResponse(response);
    } on SocketException {
      throw Exception("No internet connection");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    dynamic responseJson;

    try {
      switch (response.statusCode) {
        case 200:
          responseJson = jsonDecode(response.body);
          print("${Status.Success}:${jsonDecode(response.body)}");
          return responseJson;
        case 400:
          responseJson = jsonDecode(response.body);
          print("${Status.Success}:${jsonDecode(response.body)}");
          return responseJson;
        default:
      }
    } catch (e) {
      print(e);
    } on SocketException {
      print("SocketException : Please check you internet connection");
    }
  }
}
