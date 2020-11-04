import 'package:flutter/material.dart';
import 'package:trackit/pages/home.dart';
import 'package:trackit/pages/login.dart';
import 'package:trackit/pages/register.dart';
import 'package:trackit/pages/splash.dart';

void main() {
  runApp(TracKit());
}

class TracKit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => Splash(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/home': (context) => Home(),
      },
    );
  }
}
