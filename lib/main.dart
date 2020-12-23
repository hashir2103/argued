import 'package:argued/ArguedConfigs/theme.dart';
import 'package:argued/controller/AuthBloc.dart';
import 'package:argued/controller/DashboadBloc.dart';
import 'package:argued/frontend/screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ArguedConfigs/routes.dart';

void main() {
  runApp(MyApp());
}

final authBloc = AuthBloc();
final dashboardBloc = DashboardBloc();

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
    return MultiProvider(
        providers: [
          Provider(create: (context) => authBloc),
          Provider(create: (context) => dashboardBloc),
        ],
        child: MaterialApp(
          title: 'Argued.com',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routes.materialPageRoute,
          theme: theme(),
          home: LoginScreen(),
        ));
  }
}
