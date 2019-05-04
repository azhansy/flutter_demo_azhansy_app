import 'package:flutter/material.dart';
import 'package:flutter_demo_azhansy_app/ui/main/model/home_page_model.dart';

class Arrays {

  ///列表 测试入口
  static List<HomePageModel> mainList = <HomePageModel>[
    HomePageModel('storyApp', Icons.book),
    HomePageModel('adidas', Icons.radio),
    HomePageModel('music', Icons.library_music),
  ];
}