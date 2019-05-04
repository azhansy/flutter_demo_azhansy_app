import 'package:flutter/material.dart';

class MovieAppUiPage extends StatefulWidget {
  @override
  _MovieAppUiPageState createState() => _MovieAppUiPageState();
}

class _MovieAppUiPageState extends State<MovieAppUiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("movie"),
      ),
      body: Container(
        child: Center(
          child: Text("movie"),
        ),
      ),
    );
  }
}
