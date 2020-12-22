
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/frontend/widgets/AppButton.dart';
import 'package:flutter/material.dart';

class AppDialog {
  loginDailog(context,String message) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                'Error Login',
                style: bigHeadingText(),
              ),
              content: Column(
                children: [
                  Text(
                    message,
                    style: normalText(),
                  )
                ],
              ),
              actions: [
                AppButton(text: 'Close', onTap: ()=>Navigator.pop(context)),
              ],
            ));
  }
}

