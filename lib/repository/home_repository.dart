

import 'package:mvvm_provider/data/network/BaseApiServices.dart';
import 'package:mvvm_provider/data/network/NetworkApiServices.dart';
import 'package:mvvm_provider/model/movie_model.dart';
import 'package:mvvm_provider/res/app_url.dart';

class HomeRepository{

  BaseApiService apiService = NetworkApiService();

  Future<MovieListModel> fetchMoviesList() async{
    try{
      dynamic response = await apiService.getGetApiResponse(AppUrl.movieEndPointUrl);

      return response= MovieListModel.fromJson(response);

    }catch(e){
      throw e;

    }
  }


}