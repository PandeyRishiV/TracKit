import 'package:flutter/material.dart';
import 'package:trackit/services/auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Variables
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.blue,
            buttonTheme: ButtonThemeData(
              buttonColor: Colors.blue[600],
              textTheme: ButtonTextTheme.accent,
            ),
            accentColor: Colors.white,
            errorColor: Colors.red),
        home: Scaffold(
          body: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // WELCOME MESSAGE
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 60, 50),
                  child: Text(
                    "Welcome,\nRegister To Continue",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 30,
                    ),
                  ),
                ),

                //EMAIL ID TEXT FIELD
                Container(
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 20),
                  child: TextFormField(
                    validator: (val) => val.isEmpty ? 'Enter Email Id' : null,
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                    decoration: InputDecoration(
                        icon: Icon(Icons.mail_outline), labelText: "Email ID"),
                  ),
                ),

                //PASSWORD TEXT FIELD
                Container(
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 40),
                  child: TextFormField(
                    validator: (val) => val.length < 8
                        ? 'Password length should be at least 8 characters'
                        : null,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.border_color),
                      labelText: "Password",
                    ),
                  ),
                ),

                //REGISTER BUTTON
                Container(
                  child: RaisedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        dynamic result = await _auth.registerEmailAndPassword(
                            email, password);
                        if (result == null) {
                          error = "Something went wrong, please try again";
                        } else {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, "/login");
                        }
                      }
                    },
                    child: Text(
                      "Register",
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  error,
                  style: TextStyle(
                      color: Theme.of(context).errorColor, fontSize: 16),
                ),
                SizedBox(
                  height: 50,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/login");
                  },
                  child: Text("Already a User? Login here",
                      style: TextStyle(
                          color: Colors.blue[300],
                          decoration: TextDecoration.underline)),
                ),
              ],
            ),
          ),
        ));
  }
}
