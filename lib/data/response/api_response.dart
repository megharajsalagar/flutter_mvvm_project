import 'package:mvvm_project/data/response/api_status.dart';

class ApiResponse<T> {

Status? status;
T? data;
String? message;
int? code ;

ApiResponse(this.status,this.data,this.message,this.code);

ApiResponse.loading(): status = Status.LOADING;

ApiResponse.success(this.data): status = Status.COMPLETED;

ApiResponse.error(this.message) : status = Status.ERROR;

@override 
String toString(){
  return 'ApiResponse {Status : $status, Message: $message, data: $data,code:$code}';
}

}