import 'package:flutter/cupertino.dart';
import 'package:mvvm_project/core/models/login_request_model.dart';
import 'package:mvvm_project/data/response/api_status.dart';
import 'package:mvvm_project/repository/login/login_impl.dart';
import 'package:mvvm_project/repository/login/login_repository.dart';
import 'package:mvvm_project/utils/utils.dart';

class LoginViewModel extends ChangeNotifier {
  LoginRepositoryImpl _myRepo = LoginRepositoryImpl();

  Future<dynamic> submitLoginDetails(String email, String password) async {
    await _myRepo
        .loginApi(LoginRequestModel(email: email, password: password))
        .then((value) {
      if (value.status == Status.Success) {
        print("Response :${value.toString()}");
        Utils.toastMessage("Login Successfull");
      }
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }
}
