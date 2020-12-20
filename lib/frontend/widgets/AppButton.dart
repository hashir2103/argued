import 'package:argued/ArguedConfigs/color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  String text;
  Function onTap;
  AppButton({this.text = '',this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
          child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(text,style: TextStyle(color: Colors.white,fontSize: 20),),
        ),
      ),
    );
  }
}
