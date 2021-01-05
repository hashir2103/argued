import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:flutter/material.dart';

class GroupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return null;
      },
      child: Scaffold(
        body: Center(
          child: Text(
            "GroupScreen",
            style: bigHeadingText(),
          ),
        ),
      ),
    );
  }
}
