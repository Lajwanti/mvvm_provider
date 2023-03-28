import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_provider/data/response/api_response.dart';
import 'package:mvvm_provider/model/movie_model.dart';
import 'package:mvvm_provider/repository/home_repository.dart';

class HomeViewViewModel with ChangeNotifier{

  final _myrepo = HomeRepository();


  ApiResponse<MovieListModel> movieList = ApiResponse.loading();

  setMovieList(ApiResponse<MovieListModel> response){
    movieList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesList()async{
    setMovieList(ApiResponse.loading());

    _myrepo.fetchMoviesList().then((value){

      setMovieList(ApiResponse.complete(value));


    }).onError((error, stackTrace){
      setMovieList(ApiResponse.error(error.toString()));
    });
  }


}
