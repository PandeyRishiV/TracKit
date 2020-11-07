import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackit/pages/home.dart';
import 'package:trackit/pages/login.dart';
import 'package:trackit/pages/register.dart';
import 'package:trackit/pages/splash.dart';
import 'package:trackit/services/auth.dart';
import 'package:trackit/wrapper.dart';

import 'models/users.dart';

void main() {
  runApp(TracKit());
}

class TracKit extends StatefulWidget {
  @override
  _TracKitState createState() => _TracKitState();
}

class _TracKitState extends State<TracKit> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users>.value(
      value: AuthService().user,
      child: MaterialApp(
        routes: {
          '/': (context) => Splash(),
          '/login': (context) => Login(),
          '/register': (context) => Register(),
          '/home': (context) => Home(),
          '/wrapper': (context) => Wrapper(),
        },
      ),
    );
  }
}
