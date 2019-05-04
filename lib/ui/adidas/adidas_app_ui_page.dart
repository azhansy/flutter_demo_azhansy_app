import 'package:flutter/material.dart';

class AdidasAppUiPage extends StatefulWidget {
  @override
  _AdidasAppUiPageState createState() => _AdidasAppUiPageState();
}

class _AdidasAppUiPageState extends State<AdidasAppUiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("adidas"),
      ),
      body: Container(
        child: Center(
          child: Text("adidas"),
        ),
      ),
    );
  }
}
