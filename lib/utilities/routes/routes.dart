
import 'package:flutter/material.dart';
import 'package:mvvm_provider/utilities/routes/routes_name.dart';
import 'package:mvvm_provider/view/home_screen.dart';

import '../../view/loginView.dart';
import '../../view/signup_view.dart';
import '../../view/splash_screen.dart';

class Routes{

 static Route<dynamic> generateRoute(RouteSettings settings) {
   switch (settings.name) {
     //splash screen route
     case RoutesName.splashscreen:
       return MaterialPageRoute(builder: (BuildContext context) => const SplashView());
    //home screen route
     case RoutesName.homeScreen:
       return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());

       //Login screen route
       case RoutesName.loginScreen:
       return MaterialPageRoute(builder: (BuildContext context) => const LoginView());

       //Signup screen route
       case RoutesName.signupscreen:
       return MaterialPageRoute(builder: (BuildContext context) => const SignUpView());

     default :
       return MaterialPageRoute(builder: (_){
         return const Scaffold(
           body: Center(
             child: Text("No route define"),
           ),
         );
       });
   }

 }

}