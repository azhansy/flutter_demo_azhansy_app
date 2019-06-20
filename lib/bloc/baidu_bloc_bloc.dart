import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

class BaiduBlocBloc extends Bloc<BaiduBlocEvent, BaiduBlocState> {
  @override
  BaiduBlocState get initialState => InitialBaiduBlocState();

  @override
  Stream<BaiduBlocState> mapEventToState(
    BaiduBlocEvent event,
  ) async* {
    print("接收Bloc=====");

    if (event is BaiduBlocEvent) {
      print("接收到 BaiduBlocEvent===== ");
      await Future.delayed(Duration(seconds: 2));
      print("bloc 请求接口===== 数据=");

      yield BaiduBlocImplState("netnetnetnet=========");
    }
  }
}
