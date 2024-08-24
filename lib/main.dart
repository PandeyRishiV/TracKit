import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trackit/pages/addKit.dart';
import 'package:trackit/pages/browse.dart';
import 'package:trackit/pages/home.dart';
import 'package:trackit/pages/login.dart';
import 'package:trackit/pages/register.dart';
import 'package:trackit/pages/search.dart';
import 'package:trackit/pages/settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //Variables
  final Brightness brightness = Brightness.light;
  final Color primary = Color.fromRGBO(11, 43, 53, 1);
  final Color primaryDark = Color.fromRGBO(9, 38, 47, 1);
  final Color accent = Color.fromRGBO(194, 120, 89, 1);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //App Name
      title: 'TracKit',

      //Theme
      theme: ThemeData(
        //Colors
        brightness: Brightness.light,
        primaryColor: primary,
        primaryColorDark: primaryDark,

        //App Bar
        appBarTheme: AppBarTheme(
            elevation: 0.0,
            titleSpacing: 30,
            titleTextStyle: TextStyle(color: accent, fontSize: 28),
            backgroundColor: primaryDark,
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: primaryDark)),

        //Text Field
        inputDecorationTheme: InputDecorationTheme(
            focusedBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: accent)),
            enabledBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: accent)),
            border:
                UnderlineInputBorder(borderSide: BorderSide(color: accent))),

        // Elevated Button
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(accent),
          foregroundColor: WidgetStateProperty.all<Color>(primaryDark),
        )),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accent),
      ),

      //Default page
      home: Login(),

      //Routes
      routes: <String, WidgetBuilder>{
        "/login": (BuildContext context) => Login(),
        "/register": (BuildContext context) => Register(),
        "/home": (BuildContext context) => Home(),
        "/browse": (BuildContext context) => Browse(),
        "/search": (BuildContext context) => Search(),
        "/settings": (BuildContext context) => Settings(),
        "/addKit": (BuildContext context) => AddKit(),
      },
    );
  }
}
