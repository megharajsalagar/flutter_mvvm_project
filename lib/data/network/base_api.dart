import 'package:mvvm_project/res/app_url.dart';


abstract class BaseApi {
  Future<dynamic> getGetApiResponse(String url);
  Future<dynamic> getPostApiResponse(String url,dynamic data);

}