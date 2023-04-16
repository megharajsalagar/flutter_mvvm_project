import 'package:mvvm_project/core/models/login_request_model.dart';
import 'package:mvvm_project/core/models/login_response_model.dart';
import 'package:mvvm_project/data/network/base_api.dart';
import 'package:mvvm_project/data/network/network_api_services.dart';

abstract class LoginRepository {
  Future<LoginResponseModel> loginApi(LoginRequestModel loginRequestModel);
}
