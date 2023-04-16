class LoginResponseModel {
  String? status;
  String? token;

  LoginResponseModel({this.status, this.token});

  LoginResponseModel.fromJson(Map<String, dynamic> map)
      : status = map['status'] as String,
        token = map['token'] as String;
}
