import 'package:flutter/material.dart';

class TestAppUiPage extends StatefulWidget {
  @override
  _TestAppUiPageState createState() => _TestAppUiPageState();
}

///transform
///BoxDecoration
///boxshadow
///
class _TestAppUiPageState extends State<TestAppUiPage> {
  int isCheck = 0;

  @override
  void initState() {
    super.initState();
    isCheck = 0;
    print("initState===" + isCheck.toString());
  }

  @override
  Widget build(BuildContext context) {
    print("_TestAppUiPageState===" + isCheck.toString());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("test"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            RadioButton(
                index: 0,
                check: isCheck,
                change: (check) {
                  setState(() {
                    this.isCheck = 0;
                  });
                }),
            RadioButton(
                index: 1,
                check: isCheck,
                change: (check) {
                  setState(() {
                    this.isCheck = 1;
                  });
                }),
            RadioButton(
                index: 2,
                check: isCheck,
                change: (check) {
                  setState(() {
                    this.isCheck = 2;
                  });
                }),
          ],
        ),
      ),
    );
  }

  Widget _buildTransform() {
    return Container(
      child: Text("haha"),
    );
  }
}

typedef checkChange = Function(int);

class RadioButton extends StatefulWidget {
  int index = 0;
  int check;
  checkChange change;

  RadioButton({this.index, this.check, this.change});

  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
//  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    print("ffff===" + widget.check.toString());
    return GestureDetector(
      onTap: () {
        widget.change(widget.check);
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(20),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.redAccent,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: widget.check == widget.index
              ? Icon(
                  Icons.check,
                  color: Colors.redAccent,
                  size: 50.0,
                )
              : Container(),
        ),
      ),
    );
  }
}
