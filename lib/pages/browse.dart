import 'package:flutter/material.dart';
import 'package:trackit/service/database_service.dart';

class Browse extends StatefulWidget {
  const Browse({Key? key}) : super(key: key);

  @override
  _BrowseState createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  bool _isVisibilityAllowed = false;
  List<String> _title = [];
  List<String> _description = [];

  @override
  void initState() {
    DatabaseService().getKits();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Locally imported colors
    Color _primary = Theme.of(context).primaryColor;
    Color _primaryDark = Theme.of(context).primaryColorDark;
    Color _accent = Theme.of(context).colorScheme.secondary;

    getKits();

    //List View Variables
    Icon _thumbnails = Icon(
      Icons.ac_unit,
      color: _accent,
    );

    return Scaffold(
      //BG COLOR
      backgroundColor: _primaryDark,

      //Browse App Bar
      appBar: AppBar(
        toolbarHeight: 120,
        titleSpacing: 30,
        elevation: 0,
        title: Text(
          "TracKit",
          style: TextStyle(color: _accent, fontSize: 28),
        ),
      ),

      //Browse Body
      body: SafeArea(
          child: Visibility(
        visible: _isVisibilityAllowed,
        child: ListView.builder(
            itemBuilder: (context, int index) {
              return ListTile(
                leading: _thumbnails,
                title: Text(
                  _title[index],
                  style: TextStyle(color: _accent),
                ),
                subtitle: Text(
                  _description[index],
                  style: TextStyle(color: _accent),
                ),
              );
            },
            itemCount: _title.length),
      )),

      //Floating Action Button
      floatingActionButton: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 20, 20),
        decoration: BoxDecoration(
            border: Border.all(color: _primaryDark, width: 4),
            shape: BoxShape.circle),
        child: FloatingActionButton(
          backgroundColor: _primary,
          elevation: 6,
          splashColor: _accent,
          onPressed: () async {
            Navigator.pushNamed(context, "/addKit");
          },
          child: Icon(
            Icons.add,
            color: _accent,
          ),
        ),
      ),
    );
  }

  void getKits() {}
}
