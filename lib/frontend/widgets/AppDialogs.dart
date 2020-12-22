import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/sizeConfig.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:flutter/material.dart';

class MyAppDailog {
  loginDailog(msg, context) {
    var dailog = Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
          width: SizeConfig.screenWidth,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Argued.com",style:TextStyle(color: Colors.white,fontSize: 30),),
              SizedBox(height: 10,),
              Text(
                msg,
                style: normalText(),
              ),
              ],
          )),
    );
    return dailog;}
}
