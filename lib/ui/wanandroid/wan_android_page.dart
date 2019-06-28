import 'package:flutter/material.dart';
import 'package:flutter_demo_azhansy_app/ui/wanandroid/wan_mine_page.dart';
import 'package:flutter_demo_azhansy_app/ui/wanandroid/wan_find_page.dart';
import 'package:flutter_demo_azhansy_app/ui/wanandroid/wan_home_page.dart';

///玩Android 页面
class WanAndroidPage extends StatefulWidget {
  @override
  _WanAndroidPageState createState() => _WanAndroidPageState();
}

class _WanAndroidPageState extends State<WanAndroidPage> {
  List _list = ["首页", "发现", "我的"];

  List<BottomNavigationBarItem> _listBottom = [];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _listBottom.add(BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text(_list[0]),
    ));
    _listBottom.add(BottomNavigationBarItem(
      icon: Icon(Icons.find_in_page),
      title: Text(_list[1]),
    ));
    _listBottom.add(BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      title: Text(_list[2]),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("玩Android"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _currentIndex = index;
          setState(() {});
        },
        items: _listBottom,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[WanHomePage(), WanFindPage(), WanMinePage()],
      ),
    );
  }
}
