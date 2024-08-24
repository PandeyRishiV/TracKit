import 'package:flutter/material.dart';
import 'package:trackit/service/auth_service.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    //Locally imported colors
    Color _primary = Theme.of(context).primaryColor;
    Color _primaryDark = Theme.of(context).primaryColorDark;
    Color _accent = Theme.of(context).colorScheme.secondary;
    return Scaffold(
      //BG COLORS
      backgroundColor: _primaryDark,

      //Settings App Bar
      appBar: AppBar(
        toolbarHeight: 120,
        title: Text("Settings"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(_primary)),
              child: Text(
                "Sign out",
                style: TextStyle(color: _accent),
              ),
              onPressed: () async {
                if (await AuthService().signoutUser()) {
                  Navigator.popAndPushNamed(context, "/login");
                } else {}
              },
            )
          ],
        ),
      ),
    );
  }
}
