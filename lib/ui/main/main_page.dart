import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_azhansy_app/res/array_res.dart';
import 'package:flutter_demo_azhansy_app/ui/main/model/home_page_model.dart';

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
        itemCount: list.length,
        itemBuilder: (context, index) {
          print("azhansy,index=$index");
          return _buildItemRow(list[index]);
        });
  }

  Widget _buildItemRow(HomePageModel model) {
    return ListTile(
      title: Text(model.labelTxt),
      subtitle: Text(model.labelTxt.substring(0,1)),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
