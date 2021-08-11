import 'package:flutter/material.dart';

import 'package:live_app/src/signUp.dart';
import 'src/LoginPage.dart';
import 'src/dashboard.dart';
import 'src/HomePage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyApp() : super();
  _MyApp createState() => _MyApp();
  }


class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
         '/': (context) => LoginPage(),
        '/signUp': (context)=> SignUpPage(),
        '/dashboard':(context)=> DashBoardPage(),
        '/home':(context)=> HomePage(),

      },
    );
  }
}

