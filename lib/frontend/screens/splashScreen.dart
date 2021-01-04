import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:argued/backend/hiveDB.dart';
import 'package:argued/controller/AuthBloc.dart';
import 'package:argued/controller/catergoryBloc.dart';
import 'package:argued/frontend/screens/loginScreen.dart';
import 'package:argued/frontend/widgets/AppIcon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  HiveDB db = HiveDB();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var authBloc = Provider.of<AuthBloc>(context);
    var categoryBloc = Provider.of<CatergoryBloc>(context);
    authBloc.retreiveCredential();
    categoryBloc.getCategory();
    return Scaffold(
      body: Center(
        child: AnimatedSplashScreen(
          animationDuration: Duration(milliseconds: 1000),
          duration: 1000,
          splashTransition: SplashTransition.rotationTransition,
          curve: Curves.easeInOutBack,
          nextScreen: LoginScreen(),
          splash: AppIcon(),
        ),
      ),
    );
  }
}
