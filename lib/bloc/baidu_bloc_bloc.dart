import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import './bloc.dart';

class BaiduBlocBloc extends Bloc<BaiduBlocEvent, BaiduBlocState> {
  @override
  BaiduBlocState get initialState => InitialBaiduBlocState();

  @override
  Stream<BaiduBlocState> mapEventToState(
    BaiduBlocEvent event,
  ) async* {
    print("接收Bloc=====");

    if (event is BaiduBlocImplEvent) {
      print("接收到 BaiduBlocImplEvent===== ");
      await Future.delayed(Duration(seconds: 2));
      Dio dio = new Dio();
      print("bloc begin request data.");

      Response response = await dio.get("https://www.baidu.com");
      print("bloc 请求接口===== 数据=" + response.data);
      yield BaiduBlocImplState(response.data);
    }
  }
}
