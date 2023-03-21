import 'package:mvvm_project/data/network/base_api.dart';
import 'package:mvvm_project/data/network/network_api_services.dart';
import 'package:mvvm_project/data/response/api_response.dart';
import 'package:mvvm_project/repository/login/login_repository.dart';
import 'package:mvvm_project/res/app_url.dart';

class LoginRepositoryImpl extends LoginRepository{


 BaseApi _apiService = NetworkApiServices();


  @override
  Future<dynamic> loginApi(dynamic data) async{
      return await _apiService.getPostApiResponse(AppUrl.loginUrl, data).then((value) {
        return value;
      });
  }

}