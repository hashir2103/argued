import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/controller/DashboadBloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dashboardBloc = Provider.of<DashboardBloc>(context);

    return WillPopScope(
      onWillPop: () {
        dashboardBloc.changeIndex(1);
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
