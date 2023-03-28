
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class Utils{


  //rating function

  static double averageRating(List<int> rating){
    var aveRating =0;
    for(int i = 0 ; i< rating.length ; i++){
      aveRating = aveRating+rating[i];
    }
    
    return double.parse((aveRating/rating.length).toStringAsFixed(1));


  }

  static void FieldFocusChange(BuildContext context, FocusNode current, FocusNode next){

    current.unfocus();
    FocusScope.of(context).requestFocus(next);

  }

  static toastMessage(String message){
    Fluttertoast.showToast(
        backgroundColor: Colors.deepPurple,
        textColor: Colors.white,
        fontSize: 15,
        msg: message);

  }


  static void flushBarErrorMessage(String message, BuildContext context){
    
    showFlushbar(context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          flushbarPosition: FlushbarPosition.TOP,
          icon: const Icon(Icons.error,size: 20,color: Colors.white,),
          backgroundColor: Colors.redAccent,
          padding: const EdgeInsets.all(10),
          message: message,
          duration: const Duration(seconds: 3),

        )..show(context)
    );

  }

  
  static snackBar(String message, BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.teal,
       content: Text(message),
     )
    );

  }
}