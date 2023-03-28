
import 'package:flutter/material.dart';
import 'package:mvvm_provider/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserViewModel with ChangeNotifier {

  Future<bool> saveUser(UserModdel user) async{
    final SharedPreferences sp =await SharedPreferences.getInstance();
    sp.setString("token", user.token.toString());
    notifyListeners();

    return true;

  }


  Future<UserModdel> getUser() async{
    final SharedPreferences sp = await SharedPreferences.getInstance();

    final String? token = sp.getString("token");

    return UserModdel(
      token: token.toString(),
    );

  }

  //one method to remove session
  void removeSession() async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove("token");
  }
  // 2nd method to remove session
  Future<bool> remove2Session() async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove("token");
      return true;
  }

}