import 'package:flutter/material.dart';

class SavedWordsList extends StatefulWidget {
  @override
  createState() => new SavedWordsListState();
}

class SavedWordsListState extends State<SavedWordsList> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Saved Words"),
      ),
      body: BuildList(),
    );
  }
}

Widget BuildList() {

  return new Center(
    child: new Text("?"),
  );
}