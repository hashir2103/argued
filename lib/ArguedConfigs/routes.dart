import 'package:argued/ArguedConfigs/constant.dart';
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

      default:
        return MaterialPageRoute(builder: (context) => LoginScreen());
    }
  }
}
