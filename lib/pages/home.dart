import 'package:flutter/material.dart';
import 'package:trackit/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Variables
  final AuthService _auth = AuthService();
  int _bottomNavIndex = 0;
  List<IconData> iconList = [
    Icons.list,
    Icons.add,
    Icons.settings,
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: AppBarTheme(
            color: Colors.blue[600],
          ),
        ),
        home: Scaffold(
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
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Sign Out",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[],
          ),
        ));
  }
}
