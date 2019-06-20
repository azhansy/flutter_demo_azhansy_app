import 'package:meta/meta.dart';

@immutable
abstract class BaiduBlocState {}

class InitialBaiduBlocState extends BaiduBlocState {
}
class BaiduBlocImplState extends BaiduBlocState {
  String net;

  BaiduBlocImplState(this.net);

}
