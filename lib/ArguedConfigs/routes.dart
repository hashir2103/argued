import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/frontend/screens/ViewerDashBoardScreen.dart';
import 'package:argued/frontend/screens/editProfileScreen.dart';
import 'package:argued/frontend/screens/loginScreen.dart';
import 'package:argued/frontend/screens/signUpScreen.dart';
import 'package:argued/frontend/screens/splashScreen.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static MaterialPageRoute materialPageRoute(RouteSettings settings) {
    switch (settings.name) {
      case kSignUpScreen:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
      case kLoginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case kSplashScreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case kViewerDashBoardScreen:
        return MaterialPageRoute(builder: (context) => ViewerDashBoardScreen());
      case kEditProfileScreen:
        return MaterialPageRoute(builder: (context) => EditProfileScreen());

      default:
        return MaterialPageRoute(builder: (context) => LoginScreen());
    }
  }
}
