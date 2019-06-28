import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_azhansy_app/api/http_util.dart';

import 'bloc/bloc.dart';
import 'itemwidget/wan_home_item_widget.dart';

class WanHomePage extends StatefulWidget {
  @override
  _WanHomePageState createState() => _WanHomePageState();
}

class _WanHomePageState extends State<WanHomePage> {
  WanAndroidListBloc _listBloc;
  List _list = [];

  @override
  void initState() {
    super.initState();
    getData();
    _listBloc = WanAndroidListBloc();
//    _listBloc.dispatch(WanAndroidListImplEvent());
  }

  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
        itemCount: _list.length,
        itemBuilder: (BuildContext context, int index) {
          return WanHomeItemWidget(_list[index]);
        });
//    return BlocBuilder(
//      bloc: _listBloc,
//      builder: (context, state) {
//        return buildStateWidget(state);
//      },
//    );
  }

  Widget buildStateWidget(state) {
    if (state is InitialWanAndroidListState) {
      print("hhhhhh InitialWanAndroidListState====");
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (state is WanAndroidListImplState) {
      print("hhhhhh WanAndroidListImplState====");

      return ListView.builder(
          itemCount: state.list.length,
          itemBuilder: (BuildContext context, int index) {
            return WanHomeItemWidget(state.list[index]);
          });
    } else {
      return Container(
        child: Center(
          child: Text("无状态"),
        ),
      );
    }
  }

  void getData() async {
    print("getData= begin=====");
    var data =
        await HttpUtil.get("https://www.wanandroid.com/article/list/0/json");
    print("getData= end");
    _list.addAll(data["datas"]);
    setState(() {});
  }
}
