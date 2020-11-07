import 'package:flutter/material.dart';
import 'package:trackit/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Variables
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text("TracKit"),
        actions: [
          FlatButton.icon(
              onPressed: () async {
                dynamic result = await _auth.signOut();
                if (result == null) {
                  print("Error Occured");
                }
              },
              icon: Icon(Icons.supervised_user_circle),
              label: Text(
                "Sign Out",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    ));
  }
}
