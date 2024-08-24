import 'package:flutter/material.dart';
import 'package:trackit/pages/browse.dart';
import 'package:trackit/pages/search.dart';
import 'package:trackit/pages/settings.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Bottom navigation variables
  int _bottomNavCounter = 0;
  final _pages = [
    Browse(),
    Search(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    //Locally imported colors
    Color _primary = Theme.of(context).primaryColor;
    Color _primaryDark = Theme.of(context).primaryColorDark;
    Color _accent = Theme.of(context).colorScheme.secondary;

    return Scaffold(
      //BG COLOR
      backgroundColor: _primaryDark,

      //Body
      body: _pages[_bottomNavCounter],

      //Bottom Navigation Bar
      bottomNavigationBar: Container(
        //Shadow and highlight
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(color: _accent, blurRadius: 5, spreadRadius: 3),
          ],
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),

        //Border
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),

          //Increasing height of widget
          child: SizedBox(
            height: 90,

            //Bottom Navigation Widget
            child: BottomNavigationBar(
                showSelectedLabels: true,
                showUnselectedLabels: false,
                backgroundColor: _primary,
                selectedItemColor: _accent,
                unselectedItemColor: Colors.grey[600],
                currentIndex: _bottomNavCounter,

                //On Select
                onTap: (int index) {
                  setState(() {
                    this._bottomNavCounter = index;
                  });
                },

                //Icons and labels
                items: [
                  new BottomNavigationBarItem(
                      icon: Icon(Icons.list), label: "Browse"),
                  new BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: "Search"),
                  new BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: "Settings"),
                ]),
          ),
        ),
      ),
    );
  }
}
