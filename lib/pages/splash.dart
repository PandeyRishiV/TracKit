import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Delay for splash
    Future.delayed(const Duration(milliseconds: 5000), () {
      //Move to wrapper class
      Navigator.pop(context);
      Navigator.pushNamed(context, '/wrapper');
    });
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Logo head
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: Text(
                  "TracKit",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              //Progress Bar
              Container(
                  child: SpinKitFoldingCube(
                color: Colors.white,
                size: 50.0,
              )),
            ],
          ),
        ),
        backgroundColor: Colors.blue[900],
      ),
    );
  }
}
