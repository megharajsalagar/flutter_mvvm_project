import 'package:mvvm_project/data/network/base_api.dart';
import 'package:mvvm_project/data/network/network_api_services.dart';

abstract class LoginRepository{

  Future<dynamic> loginApi(dynamic data);
  
}