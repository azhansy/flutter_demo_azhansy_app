import 'package:flutter/material.dart';
import 'package:flutter_demo_azhansy_app/ui/main/model/home_page_model.dart';

class Arrays {
  ///列表 测试入口
  static List<HomePageModel> mainList = <HomePageModel>[
    HomePageModel('storyApp', Icons.book),
    HomePageModel('adidas', Icons.radio),
    HomePageModel('music', Icons.library_music),
    HomePageModel('movie', Icons.movie),
    HomePageModel('test', Icons.edit),
    HomePageModel('block', Icons.book),
    HomePageModel('wan_android', Icons.book),
  ];

  ///列表 测试入口
  static List<HomePageModel> drawerList = <HomePageModel>[
    HomePageModel('test1', Icons.book),
    HomePageModel('test2', Icons.radio),
    HomePageModel('test3', Icons.library_music),
    HomePageModel('test4', Icons.movie),
  ];
}
