
import 'package:mvvm_provider/data/response/status.dart';
//pass a class<T>
//<T> this is constructor and we pass data through this costructor
class ApiResponse<T>{
//status come from enum status
  Status? status;
  //dyamic function
  T? data;
  String? message;

  //use super method
  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.complete(this.data) : status = Status.COMPLETE;

  ApiResponse.error(this.message) : status = Status.ERROR;

  @override

  String toString(){
    return "Status: $status \n Message: $message \n Data: $data";
  }


}