import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trackit/services/auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //Variables
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  final scaffoldStateKey = GlobalKey<ScaffoldState>();
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //Standard Theme for the page
        theme: ThemeData(
            //Theme type
            brightness: Brightness.dark,
            //Main Color
            primaryColor: Colors.blue,
            //Second color
            accentColor: Colors.white,
            //Button Theme
            buttonTheme: ButtonThemeData(
              buttonColor: Colors.blue[600],
              textTheme: ButtonTextTheme.accent,
            ),
            //Snackbar Theme
            snackBarTheme: SnackBarThemeData(
                backgroundColor: Colors.blue[600],
                contentTextStyle: TextStyle(color: Colors.black)),
            //Error
            errorColor: Colors.red),
        home: Scaffold(
          key: scaffoldStateKey,
          body: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // WELCOME MESSAGE
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 60, 50),
                  child: Text(
                    "Welcome,\nLogin To Continue",
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
                        icon: Icon(Icons.mail_outline),
                        labelText: "Email ID",
                      )),
                ),

                //PASSWORD TEXT FIELD
                Container(
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 40),
                  child: TextFormField(
                    validator: (val) => val.isEmpty ? 'Enter Password' : null,
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

                //LOGIN BUTTON
                Container(
                  child: RaisedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        dynamic result = await _authService
                            .signInEmailAndPassword(email, password);
                        if (result == null) {
                          scaffoldStateKey.currentState.showSnackBar(SnackBar(
                            content: Text(
                              "Something went wrong, please try again",
                            ),
                          ));
                        }
                      }
                    },
                    child: Text(
                      "Login",
                    ),
                  ),
                ),
                //Space
                SizedBox(
                  height: 70,
                ),
                //FORGOT PASSWORD
                FlatButton(
                  onPressed: () {
                    if (email.isNotEmpty) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Reset Password Request"),
                              content: Text(
                                  "This will send you a mail with a link using which you can reset your password"),
                              actions: [
                                FlatButton(
                                    onPressed: () async {
                                      //SETUP FIREBASE RESET PASSWORD
                                      dynamic result = await _authService
                                          .resetPassword(email);
                                      Navigator.pop(context);
                                      FocusScope.of(context).unfocus();
                                      if (result == false) {
                                        scaffoldStateKey.currentState
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    "Something went wrong, please try again")));
                                      } else {
                                        scaffoldStateKey.currentState
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    "Password reset mail sent")));
                                      }
                                    },
                                    child: Text("Ok")),
                                FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Cancel"),
                                )
                              ],
                            );
                          });
                    } else {
                      scaffoldStateKey.currentState.showSnackBar(SnackBar(
                          content: Text("To reset password enter email id")));
                    }
                  },
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(
                        color: Colors.blue[300],
                        decoration: TextDecoration.underline),
                  ),
                ),
                //Space
                SizedBox(
                  height: 10,
                ),
                //Register page
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/register");
                  },
                  child: Text(
                    "Not a User? Register here",
                    style: TextStyle(
                        color: Colors.blue[300],
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
