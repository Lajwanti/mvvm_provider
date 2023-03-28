
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mvvm_provider/data/app_exceptions.dart';
import 'package:mvvm_provider/data/network/BaseApiServices.dart';

class NetworkApiService extends BaseApiService{
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;

    try{
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponseJson(response);
    }on SocketException{
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;

  }

  @override
  Future getPostApiResponse(String url, dynamic data) async{
    dynamic responseJson;

    try{
      Response response = await post(Uri.parse(url),body:data).timeout(const Duration(seconds: 10));
      responseJson = returnResponseJson(response);
    }on SocketException{
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  dynamic returnResponseJson(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        return BadRequestException(response.body.toString());

      case 404:
        return UnAuthorisedException(response.body.toString());


      default :
         throw FetchDataException("Error occurred while communicating with server"+
             "with status code"+response.statusCode.toString());

    }



  }
}