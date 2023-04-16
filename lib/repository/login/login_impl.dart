import 'package:mvvm_project/core/models/login_request_model.dart';
import 'package:mvvm_project/core/models/login_response_model.dart';
import 'package:mvvm_project/data/network/base_api.dart';
import 'package:mvvm_project/data/network/network_api_services.dart';
import 'package:mvvm_project/data/response/api_response.dart';
import 'package:mvvm_project/repository/login/login_repository.dart';
import 'package:mvvm_project/res/app_url.dart';

class LoginRepositoryImpl extends LoginRepository {
  BaseApi _apiService = NetworkApiServices();

  @override
  Future<LoginResponseModel> loginApi(
      LoginRequestModel loginRequestModel) async {
    return await _apiService
        .getPostApiResponse(
            endpoint: AppUrl.loginUrl, body: loginRequestModel.toJson())
        .then((value) {
      return LoginResponseModel.fromJson(value);
    });
  }
}
