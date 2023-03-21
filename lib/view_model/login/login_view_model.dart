import 'package:flutter/cupertino.dart';
import 'package:mvvm_project/repository/login/login_impl.dart';
import 'package:mvvm_project/repository/login/login_repository.dart';

class LoginViewModel extends ChangeNotifier{

  
  LoginRepositoryImpl _myRepo = LoginRepositoryImpl();  
  Map loginDetails = {
    "email": "eve.holt@reqres.in",
    "password": "cityslicka"
};

  Future<dynamic> submitLoginDetails() async{
    await _myRepo.loginApi(loginDetails).then((value) {
      print("value:"+value.toString());
    }).onError((error, stackTrace) {
      print(error.toString());
    });

  }
}