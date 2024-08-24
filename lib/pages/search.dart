import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    //Locally imported colors
    Color _primary = Theme.of(context).primaryColor;
    Color _primaryDark = Theme.of(context).primaryColorDark;
    Color _accent = Theme.of(context).colorScheme.secondary;
    return Scaffold(
      //BG COLOR
      backgroundColor: _primaryDark,

      //Search App Bar
      appBar: AppBar(
        toolbarHeight: 120,
        title: Text("Search"),
      ),
    );
  }
}
