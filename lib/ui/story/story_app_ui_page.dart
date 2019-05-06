import 'package:flutter/material.dart';
import 'package:flutter_demo_azhansy_app/ui/story/model/data.dart';

class StoryAppUiPage extends StatefulWidget {
  @override
  _StoryAppUiPageState createState() => _StoryAppUiPageState();
}

class _StoryAppUiPageState extends State<StoryAppUiPage> {
  var currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF1b1e44), Color(0xFF2d3447)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              //https://docs.flutter.io/flutter/painting/LinearGradient/tileMode.html
              tileMode: TileMode.clamp)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("story"),
//          leading: Icon(Icons.book),
        ),
        body: Center(
            child: Column(
//              mainAxisAlignment: ,
          children: <Widget>[
            Text(
              "STORY",
              style: TextStyle(color: Colors.white),
            ),
            Hero(
              tag: "book0",
              child: Icon(
                Icons.book,
                size: 200,
                color: Colors.green,
              ),
            ),
          ],
        )),
      ),
    );
//    return Scaffold(
//      appBar: AppBar(
//        centerTitle: true,
//        title: Text("Story"),
//      ),
//      body: Container(
//        child: Center(
//          child: Text("story"),
//        ),
//      ),
//    );
  }
}
