import 'package:argued/ArguedConfigs/theme.dart';
import 'package:argued/backend/hiveDB.dart';
import 'package:argued/controller/AuthBloc.dart';
import 'package:argued/controller/DashboadBloc.dart';
import 'package:argued/controller/ProfileBloc.dart';
import 'package:argued/controller/LocationBloc.dart';
import 'package:argued/controller/catergoryBloc.dart';
import 'package:argued/frontend/screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'ArguedConfigs/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveDB.init;
  runApp(MyApp());
}

// All App Controllers
final authBloc = AuthBloc();
final dashboardBloc = DashboardBloc();
final profileBloc = ProfileBloc();
final locationBloc = LocationBloc();
final catergoryBloc = CatergoryBloc();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    authBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MultiProvider(
        providers: [
          Provider(create: (context) => authBloc),
          Provider(create: (context) => dashboardBloc),
          Provider(create: (context) => profileBloc),
          Provider(create: (context) => locationBloc),
          Provider(create: (context) => catergoryBloc),
        ],
        child: MaterialApp(
          title: 'Argued.com',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routes.materialPageRoute,
          theme: theme(),
          home: SplashScreen(),
        ));
  }
}
