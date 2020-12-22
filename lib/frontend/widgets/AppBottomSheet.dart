import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/sizeConfig.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/frontend/widgets/AppButton.dart';
import 'package:argued/frontend/widgets/AppNumberField.dart';
import 'package:flutter/material.dart';

class AppBottomSheet {
  verifyCode(context) {
    showModalBottomSheet(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(35.0)),
        ),
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (context) {
          return VerificationCode();
        });
  }
}

class VerificationCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kbaseHorizontalPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 4,),
          Center(child: Container(
            height: 7,
            width: SizeConfig.screenWidth*0.2,
            decoration: BoxDecoration(
              color: primaryTextColor,
              borderRadius: BorderRadius.circular(35)
            ),
          ),),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
            child: Text(
              'Enter 4 Digit Code',
              style: bigHeadingText(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
            child: Text(
              "Enter the 4 digit code recieved on your email",
              style: normalText(),
            ),  
          ),
          SizedBox(height: 25,),       
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
            child:AppNumberField(),),
          SizedBox(height: 25,),       
          AppButton(text: 'Continue',onTap: ()=>Navigator.pop(context),),
          SizedBox(height: 20,)       
        ],
      ),
    );
  }
}
