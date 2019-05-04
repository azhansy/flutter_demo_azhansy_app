import 'package:flutter/material.dart';

class StoryAppUiPage extends StatefulWidget {
  @override
  _StoryAppUiPageState createState() => _StoryAppUiPageState();
}

class _StoryAppUiPageState extends State<StoryAppUiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Story"),
      ),
      body: Container(
        child: Center(
          child: Text("story"),
        ),
      ),
    );
  }
}
