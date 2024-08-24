import 'package:flutter/material.dart';
import 'package:trackit/service/database_service.dart';

class AddKit extends StatefulWidget {
  const AddKit({Key? key}) : super(key: key);

  @override
  _AddKitState createState() => _AddKitState();
}

class _AddKitState extends State<AddKit> {
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();
  TextEditingController _tagsController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    //locally imported colors
    Color _primary = Theme.of(context).primaryColor;
    Color _primaryDark = Theme.of(context).primaryColorDark;
    Color _accent = Theme.of(context).colorScheme.secondary;
    return Scaffold(
      backgroundColor: _primaryDark,
      appBar: AppBar(
        //Title
        title: Text("Add Item"),

        //Height
        toolbarHeight: 90,
        titleSpacing: 0,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(30),
          children: <Widget>[
            TextField(
              controller: _titleController,
              cursorColor: _accent,
              style: TextStyle(color: _accent),
              decoration: InputDecoration(
                  hintText: "Name of the object",
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  labelText: "Title",
                  labelStyle: TextStyle(color: _accent)),
            ),
            TextField(
              controller: _descriptionController,
              cursorColor: _accent,
              style: TextStyle(color: _accent),
              decoration: InputDecoration(
                  hintText: "Where are you keeping this object",
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  labelText: "Description",
                  labelStyle: TextStyle(color: _accent)),
            ),
            TextField(
              controller: _tagsController,
              cursorColor: _accent,
              style: TextStyle(color: _accent),
              decoration: InputDecoration(
                  hintText: "Tags ease searching this item later on",
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  labelText: "Tags",
                  labelStyle: TextStyle(color: _accent)),
            ),
          ],
        ),
      ),

      //Floating Action Button
      floatingActionButton: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 20, 80),
        child: FloatingActionButton(
          backgroundColor: _primary,
          elevation: 6,
          splashColor: _accent,
          onPressed: () {},
          child: Icon(
            Icons.add_a_photo_outlined,
            color: _accent,
          ),
        ),
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        color: _primaryDark,
        child: ElevatedButton(
          child: Text("Save"),
          onPressed: () {
            if (_titleController.text.isNotEmpty &&
                _tagsController.text.isNotEmpty) {
              DatabaseService().addKit(_titleController.text,
                  _descriptionController.text, _tagsController.text, "");
              Navigator.popAndPushNamed(context, "/home");
            }
          },
        ),
      ),
    );
  }
}
