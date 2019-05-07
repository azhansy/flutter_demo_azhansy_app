import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo_azhansy_app/ui/story/model/data.dart';

class StoryAppUiPage extends StatefulWidget {
  @override
  _StoryAppUiPageState createState() => _StoryAppUiPageState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

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
          backgroundColor: Color(0xFF1b1e44),
          leading: Icon(Icons.menu),
          actions: <Widget>[
            Container(
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
//        appBar: AppBar(
//          title: Text("story"),
//          brightness: Brightness.light,
////          leading: Icon(Icons.book),
//        ),
        //滑动
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            children: <Widget>[
//              Padding(
//                padding: const EdgeInsets.only(
//                    left: 12, top: 30, right: 12, bottom: 8),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    IconButton(
//                      icon: Icon(
//                        Icons.menu,
//                        color: Colors.white,
//                        size: 30,
//                      ),
//                      onPressed: () {},
//                    ),
//                    IconButton(
//                      icon: Icon(
//                        Icons.search,
//                        color: Colors.white,
//                        size: 30,
//                      ),
//                      onPressed: () {},
//                    )
//                  ],
//                ),
//              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Trending",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 46,
                          fontFamily: "Calibre-Semibold",
                          letterSpacing: 1),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFff6e6e),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 6, horizontal: 22),
                          child: Text(
                            "Animated",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "25 + Stories",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ],
                ),
              ),
              Stack(
                children: <Widget>[
                  CardScrollWidget(currentPage),
                  Positioned.fill(
                    child: PageView.builder(
                        itemCount: images.length,
                        controller: controller,
                        //这个是手势符合日常的
                        reverse: true,
                        itemBuilder: (context, index) {
                          return Container();
                        }),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Favorite",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 46,
                          fontFamily: "Calibre-Semibold",
                          letterSpacing: 1),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 18),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        images[1],
                        width: 296,
                        height: 222,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              )
            ],
//              Hero(
//                tag: "book0",
//                child: Icon(
//                  Icons.book,
//                  size: 200,
//                  color: Colors.green,
//                ),
//              ),
          )),
        ),
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

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, constraints) {
        //LayoutBuilder用于获得视口的大小
        var width = constraints.maxWidth;
        var height = constraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = List();
        for (var i = 0; i < images.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0);

          var cardItem = Positioned.directional(
              top: padding + verticalInset * max(-delta, 0),
              bottom: padding + verticalInset * max(-delta, 0),
              start: start,
              textDirection: TextDirection.rtl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(3, 6),
                        blurRadius: 10)
                  ]),
                  child: AspectRatio(
                    aspectRatio: cardAspectRatio,
                    child: Stack(
                      //https://docs.flutter.io/flutter/rendering/StackFit-class.html
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image.asset(
                          images[i],
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 12, bottom: 12),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 22, vertical: 6),
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    "Read Later",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
          cardList.add(cardItem);
        }
        return Stack(children: cardList);
      }),
    );
  }
}
