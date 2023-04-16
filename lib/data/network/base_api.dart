import 'package:mvvm_project/res/app_url.dart';


abstract class BaseApi {
  Future<dynamic> getGetApiResponse({required String endpoint,Map<String,dynamic>? query});
  Future<dynamic> getPostApiResponse({required String endpoint,Map<String,dynamic>? body});

}