import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackit/pages/home.dart';
import 'package:trackit/pages/login.dart';
import 'models/users.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    if (user != null) {
      return Home();
    } else {
      return Login();
    }
  }
}
