import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trackit/service/auth_service.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //Variables
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Icon _eyeState = Icon(Icons.visibility_off);
  bool _visible = false;
  bool _validateEmail = true;
  bool _validatePassword = true;

  @override
  Widget build(BuildContext context) {
    //Locally imported colors
    Color _primary = Theme.of(context).primaryColor;
    Color _primaryDark = Theme.of(context).primaryColorDark;
    Color _accent = Theme.of(context).colorScheme.secondary;
    return Scaffold(
      //Custom Background Color
      backgroundColor: _primary,

      //App Bar
      appBar: AppBar(
          toolbarHeight: 150,
          backgroundColor: _primary,
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: _primary),
          //Title and Sub-Title
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title
              Text(
                'TracKit',
              ),
              SizedBox(
                height: 10,
              ),

              //Sub-Title
              Text(
                'Login To Continue',
                style: TextStyle(color: _accent, fontSize: 18),
              )
            ],
          )),

      //Body
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.all(30),
        children: <Widget>[
          SizedBox(
            height: 120.0,
          ),

          //Email Text Field
          TextField(
            controller: _emailController,
            cursorColor: _accent,
            style: TextStyle(color: _accent),
            textInputAction: TextInputAction.next,
            //Text Field Styling
            decoration: InputDecoration(
              labelText: "Username or Email",
              errorText: _validateEmail ? null : "Enter email address",
              labelStyle: TextStyle(color: _accent),
            ),
          ),

          SizedBox(
            height: 12.0,
          ),

          //Password Text Field
          TextField(
            controller: _passwordController,
            cursorColor: _accent,
            style: TextStyle(color: _accent),
            //Text Field Styling
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: _eyeState,
                color: _accent,
                onPressed: () {
                  setState(() {
                    if (_visible) {
                      _eyeState = Icon(Icons.visibility_off);
                      _visible = false;
                    } else {
                      _eyeState = Icon(Icons.visibility);
                      _visible = true;
                    }
                  });
                },
              ),
              labelText: "Password",
              errorText: _validatePassword ? null : "Enter password",
              labelStyle: TextStyle(color: _accent),
            ),
            obscureText: !_visible,
          ),

          SizedBox(
            height: 40.0,
          ),

          //Cancel and Next Buttons
          ButtonBar(
            children: <Widget>[
              //Cancel
              TextButton(
                  onPressed: () {
                    _emailController.clear();
                    _passwordController.clear();
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: _accent),
                  )),

              //Next
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    _emailController.text.isNotEmpty
                        ? _validateEmail = true
                        : _validateEmail = false;
                    _passwordController.text.isNotEmpty
                        ? _validatePassword = true
                        : _validatePassword = false;
                  });
                  if (_validateEmail && _validatePassword) {
                    bool isLoggedIn = await AuthService().loginUser(
                        _emailController.text, _passwordController.text);
                    isLoggedIn
                        ? Navigator.popAndPushNamed(context, "/home")
                        : null;
                  }
                },
                child: Text('Next', style: TextStyle(color: _primary)),
              ),
            ],
          ),

          SizedBox(
            height: 120,
          ),

          //Forgot password and Register Buttons
          ButtonBar(
            alignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              //Forgot Password
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(color: _accent),
                  )),

              //Register
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/register");
                  },
                  child: Text(
                    "Create Account",
                    style: TextStyle(color: _accent),
                  )),
            ],
          )
        ],
      )),
    );
  }
}
