import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_demo_azhansy_app/api/http_util.dart';

import './bloc.dart';

class WanAndroidListBloc
    extends Bloc<WanAndroidListEvent, WanAndroidListState> {
  @override
  WanAndroidListState get initialState => InitialWanAndroidListState();

  @override
  Stream<WanAndroidListState> mapEventToState(
    WanAndroidListEvent event,
  ) async* {
    if (event is WanAndroidListImplEvent) {
      print("接收 请求的 WanAndroidListImplEvent=====");
      var result = await HttpUtil.get("article/list/0/json");
      print("bloc 请求接口===== 数据=" + result["datas"]);
      yield WanAndroidListImplState(result["datas"]);
    }
  }
}
