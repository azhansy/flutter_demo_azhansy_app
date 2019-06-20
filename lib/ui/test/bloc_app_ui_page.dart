import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_azhansy_app/bloc/bloc.dart';

class BlocAppUiPage extends StatefulWidget {
  @override
  _BlocAppUiPageState createState() => _BlocAppUiPageState();
}

class _BlocAppUiPageState extends State<BlocAppUiPage> {
  BaiduBlocBloc _bloc;

  @override
  void initState() {
    _bloc = BaiduBlocBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("test"),
      ),
      body: BlocBuilder(
          bloc: _bloc,
          builder: (content, state) {
            return Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  _buildBtn(),
                  _buildText(state),
                ],
              ),
            );
          }),
    );
  }

  Widget _buildBtn() {
    return GestureDetector(
      onTap: () {
        _bloc.dispatch(BaiduBlocImplEvent());
        print("发送event=====");
      },
      child: Text("获取网络数据"),
    );
  }

  Widget _buildText(state) {
    print("state=" + state.toString());

    if (state is BaiduBlocImplState) {
      return Text(state.net);
    }
    return Text("http:::::::");
  }
}
