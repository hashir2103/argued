import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: ()=>Navigator.pushNamed(context, kViewerDashBoard),
              child: Center(
          child: Text('Home',style: bigHeadingText(),),
        ),
      ),
    );
  }
}
