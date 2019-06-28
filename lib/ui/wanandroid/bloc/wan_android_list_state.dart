import 'package:meta/meta.dart';

@immutable
abstract class WanAndroidListState {}

class InitialWanAndroidListState extends WanAndroidListState {}

class WanAndroidListImplState extends WanAndroidListState {
  List list = [];

  WanAndroidListImplState(this.list);
}
