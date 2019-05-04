import 'package:flutter/material.dart';

class MusicAppUiPage extends StatefulWidget {
  @override
  _MusicAppUiPageState createState() => _MusicAppUiPageState();
}

class _MusicAppUiPageState extends State<MusicAppUiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("music"),
      ),
      body: Container(
        child: Center(
          child: Text("music"),
        ),
      ),
    );
  }
}
