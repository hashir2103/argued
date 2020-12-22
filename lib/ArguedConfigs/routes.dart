import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/frontend/screens/ViewerDashBoardScreen.dart';
import 'package:argued/frontend/screens/homeScreen.dart';
import 'package:argued/frontend/screens/loginScreen.dart';
import 'package:argued/frontend/screens/signUpScreen.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static MaterialPageRoute materialPageRoute(RouteSettings settings) {
    switch (settings.name) {
      case kSignUpScreen:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
      case kLoginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case kHomeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case kViewerDashBoard:
        return MaterialPageRoute(builder: (context) => ViewerDashBoardScreen());

      default:
        return MaterialPageRoute(builder: (context) => LoginScreen());
    }
  }
}
