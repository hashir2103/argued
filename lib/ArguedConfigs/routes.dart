import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/frontend/screens/InviteContactScreen.dart';
import 'package:argued/frontend/screens/ViewerDashBoardScreen.dart';
import 'package:argued/frontend/screens/chatScreen.dart';
import 'package:argued/frontend/screens/groupScreen.dart';
import 'package:argued/frontend/screens/editProfileScreen.dart';
import 'package:argued/frontend/screens/contactScreen.dart';
import 'package:argued/frontend/screens/loginScreen.dart';
import 'package:argued/frontend/screens/signUpScreen.dart';
import 'package:argued/frontend/screens/splashScreen.dart';
import 'package:argued/frontend/screens/watchListScreen.dart';
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
      case kGroupScreen:
        return MaterialPageRoute(builder: (context) => GroupScreen());
      case kContactScreen:
        return MaterialPageRoute(builder: (context) => ContactScreen());
      case kWatchListScreen:
        return MaterialPageRoute(builder: (context) => WatchListScreen());
      case kChatScreen:
        return MaterialPageRoute(builder: (context) =>  ChatScreen(userName:settings.arguments,));
      case kInviteContactScreen:
        return MaterialPageRoute(builder: (context) =>  InviteContactScreen());

      default:
        return MaterialPageRoute(builder: (context) => LoginScreen());
    }
  }
}
