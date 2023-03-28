
import 'package:mvvm_provider/data/network/BaseApiServices.dart';
import 'package:mvvm_provider/data/network/NetworkApiServices.dart';
import 'package:mvvm_provider/res/app_url.dart';

class AuthRepository{

  BaseApiService _baseApiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data)async{
    try{
      dynamic response = await _baseApiService.getPostApiResponse(AppUrl.loginUrl, data);
      return response;

    }catch(e){
      throw e;

    }

  }

  Future<dynamic> registerApi(dynamic data)async{
    try{
      dynamic response = await _baseApiService.getPostApiResponse(AppUrl.registrationUrl, data);
      return response;

    }catch(e){
      throw e;

    }

  }


}