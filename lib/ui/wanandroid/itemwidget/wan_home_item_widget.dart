import 'package:flutter/material.dart';
import 'package:flutter_demo_azhansy_app/base/utils/navigator_util.dart';

import '../wan_web_view_page.dart';

class WanHomeItemWidget extends StatelessWidget {
  var item;

  WanHomeItemWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigatorUtil.pushPage2Cupertino(
          context,
          WanWebViewPage(
            title: item["title"],
            url: item["link"],
          ),
        );
      },
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(5),
        child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("作者"),
                    Text(item["author"]),
                    Text(item["niceDate"])
                  ],
                ),
                Text(item["title"])
              ],
            )),
      ),
    );
  }
}
