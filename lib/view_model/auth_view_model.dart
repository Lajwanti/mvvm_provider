

import 'package:flutter/material.dart';
import 'package:mvvm_provider/model/user_model.dart';
import 'package:mvvm_provider/repository/auth_repository.dart';
import 'package:mvvm_provider/utilities/routes/routes_name.dart';
import 'package:mvvm_provider/utilities/utils.dart';
import 'package:mvvm_provider/view_model/user_view_moddel.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier{

  final _myrepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  bool _signupLoading = false;
  bool get signuploading => _signupLoading;


  setLoading(bool value){
    _loading = value;

  notifyListeners();

  }

  setSignupLoading(bool value){
    _signupLoading = value;

    notifyListeners();

  }


  Future<void> loginApi(BuildContext context, dynamic data) async{

    setLoading(true);
    final userPreference = Provider.of<UserViewModel>(context, listen : false);
    _myrepo.loginApi(data).then((value) => {
      setLoading(false),

      userPreference.saveUser(
      UserModdel(
        token: value["token"].toString()
      ),
    ),



      Utils.flushBarErrorMessage("Login Successfully", context),
      Navigator.pushNamed(context, RoutesName.homeScreen),



      print(value.toString()),


    }).onError((error, stackTrace) => {
      setLoading(false),
      Utils.flushBarErrorMessage(error.toString(), context),
      print(error.toString()),


    });


  }

  Future<void> signUpApi(BuildContext context, dynamic data) async{
    setSignupLoading(true);
    _myrepo.registerApi(data).then((value) => {
      setSignupLoading(false),
      Utils.flushBarErrorMessage("Registration Successfully", context),
      Navigator.pushNamed(context, RoutesName.homeScreen),



      print(value.toString()),


    }).onError((error, stackTrace) => {
      setSignupLoading(false),
      Utils.flushBarErrorMessage(error.toString(), context),
      print(error.toString()),


    });


  }
}