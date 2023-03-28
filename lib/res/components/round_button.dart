import 'package:flutter/material.dart';
import 'package:mvvm_provider/res/appcolors.dart';

class RoundButton extends StatelessWidget {
  String title;
  final bool loading;
  final VoidCallback onPress;

  RoundButton({required this.title, this.loading = false, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.btnClr,
              borderRadius: BorderRadius.circular(10),
        ),
        height: 40,
        width: 200,
        child: Center(child: loading ? CircularProgressIndicator(color: AppColors.blackClr,) : Text(title,)),
      ),
    );
  }
}
