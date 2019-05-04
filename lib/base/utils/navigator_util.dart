import 'package:flutter/cupertino.dart';

//import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

class NavigatorUtil {
  //iOS 风格
  static void pushPage2Cupertino(BuildContext context, Widget page,
      {String pageName}) {
    if (context == null || page == null /*|| ObjectUtil.isEmpty(pageName)*/) {
      return;
    }
    Navigator.push(
        context, new CupertinoPageRoute<void>(builder: (ctx) => page));
  }

  //google 简约风格
  static void pushPage2Material(BuildContext context, Widget page) {
    if (context == null || page == null) {
      return;
    }

    Navigator.push(context, MaterialPageRoute<void>(builder: (ctx) => page));
  }
}
