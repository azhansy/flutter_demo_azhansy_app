import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WanWebViewPage extends StatefulWidget {
  var title = "";
  var url = "";

  WanWebViewPage({this.title, this.url});

  @override
  _WanWebViewPageState createState() => _WanWebViewPageState();
}

class _WanWebViewPageState extends State<WanWebViewPage> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      url: widget.url,
    );
  }
}
