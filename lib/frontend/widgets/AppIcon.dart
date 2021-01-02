import 'package:argued/ArguedConfigs/sizeConfig.dart';
import 'package:flutter/cupertino.dart';

class AppIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      height: SizeConfig.screenHeight * 0.25,
      width: SizeConfig.screenWidth,
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(top: 30),
        width: SizeConfig.screenWidth * 0.6,
        child: Image.asset(
          'assets/logo.png',
        ),
      ),
    );
  }
}
