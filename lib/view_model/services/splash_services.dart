
import 'package:flutter/foundation.dart';
import 'package:mvvm_provider/model/user_model.dart';
import 'package:mvvm_provider/utilities/routes/routes_name.dart';
import 'package:mvvm_provider/view_model/user_view_moddel.dart';
import 'package:flutter/material.dart';

class SplashServices{
Future<UserModdel> getUserData() => UserViewModel().getUser();

 void checkAuthentication(BuildContext context) async{

   getUserData().then((value)async{
     print(value.token.toString());
     if(value.token == "null" || value.token == ""){

       await Future.delayed(const Duration(seconds: 5));
       Navigator.pushNamed(context, RoutesName.loginScreen);
     }else{
       await Future.delayed(const Duration(seconds: 5));
       Navigator.pushNamed(context, RoutesName.homeScreen);
     }



   }).onError((error, stackTrace) {
     if(kDebugMode){
       print(error.toString());

     }
   });
 }
}