import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/backend/hiveDB.dart';
import 'package:argued/controller/AuthBloc.dart';

import 'package:argued/frontend/screens/loginScreen.dart';
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
    authBloc.retreiveCredential();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: AnimatedSplashScreen(
                animationDuration: Duration(milliseconds: 3000),
                duration:3000,
                splashTransition: SplashTransition.rotationTransition,
                curve: Curves.easeInOutBack,
                nextScreen: LoginScreen(),
                splash: Center(child: Container(
                  // height: 400,
                  // width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/appIcon.jpeg'),
                      fit: BoxFit.fitHeight
                      
                    )
                  ),
                ),)
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Argument is the cornerstone of a free society. Anything preventing argument is oppression.',
                  // 'Created By Electromates!',
                  style: bigHeadingText().copyWith(color: Colors.black.withOpacity(0.5)),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
