import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_azhansy_app/base/utils/navigator_util.dart';
import 'package:flutter_demo_azhansy_app/res/array_res.dart';
import 'package:flutter_demo_azhansy_app/ui/adidas/adidas_app_ui_page.dart';
import 'package:flutter_demo_azhansy_app/ui/main/model/home_page_model.dart';
import 'package:flutter_demo_azhansy_app/ui/movie/movie_app_ui_page.dart';
import 'package:flutter_demo_azhansy_app/ui/music/music_app_ui_page.dart';
import 'package:flutter_demo_azhansy_app/ui/story/story_app_ui_page.dart';
import 'package:flutter_demo_azhansy_app/ui/test/test_app_ui_page.dart';

///首页
class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

//AutomaticKeepAliveClientMixin：会保持一直存在，不会每次都重建
class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: _buildListWidget()),
    );
  }

  ///创建list表的item
  Widget _buildListWidget() {
    var list = Arrays.mainList;
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: list.length,
        itemBuilder: (context, index) {
          print("azhansy,index=$index");
          return _buildItemRow(list[index], index);
        });
  }

  Widget _buildItemRow(HomePageModel model, int index) {
    return ListTile(
        leading: Hero(
          tag: "book" + index.toString(),
          child: Icon(
            model.icon,
            color: Colors.amberAccent,
          ),
        ),
        title: Text(model.labelTxt),
        subtitle: Text(model.labelTxt.substring(0, 1)),
        onTap: () {
          _onTapPress1(model, index);
        });
  }

  @override
  bool get wantKeepAlive => true;

  _onTapPress1(HomePageModel model, int index) {
    if (index == 0) {
      NavigatorUtil.pushPage2Cupertino(context, StoryAppUiPage());
    } else if (index == 1) {
      NavigatorUtil.pushPage2Cupertino(context, AdidasAppUiPage());
    } else if (index == 2) {
      NavigatorUtil.pushPage2Cupertino(context, MusicAppUiPage());
    } else if (index == 3) {
      NavigatorUtil.pushPage2Material(context, MovieAppUiPage());
    } else if (index == 4) {
      NavigatorUtil.pushPage2Material(context, TestAppUiPage());
    }
  }
}
