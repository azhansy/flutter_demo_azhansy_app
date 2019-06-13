import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_azhansy_app/base/fab_bottom_app_bar.dart';
import 'package:flutter_demo_azhansy_app/res/array_res.dart';
import 'package:flutter_demo_azhansy_app/res/strings.dart';
import 'package:flutter_demo_azhansy_app/ui/main/main_page.dart';
import 'package:flutter_demo_azhansy_app/ui/main/model/home_page_model.dart';
import 'package:flutter_demo_azhansy_app/ui/me/me_page.dart';

class HomeMainPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeMainPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _allPage.length, vsync: this);
  }

  final List<HomePageModel> _allPage = <HomePageModel>[
    HomePageModel(Strings.titleHome, Icons.home),
    HomePageModel(Strings.titleMe, Icons.settings_applications)
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _allPage.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("azhansy demo"),
          ),
          drawer: buildDrawer(),
          //view
          body: TabBarView(
            controller: _tabController,
            children:
                _allPage.map((model) => buildTabView(context, model)).toList(),
          ),
          bottomNavigationBar: FABBottomAppBar(
              selectedColor: Theme.of(context).primaryColor,
              onTabSelected: (index) {
                _tabController.animateTo(index);
              },
              items: _allPage
                  .map((HomePageModel page) => FABBottomAppBarItem(
                      iconData: page.icon, text: page.labelTxt))
                  .toList()),
        ));
  }

  Drawer buildDrawer() {
    return Drawer(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  "Menu",
                  style: TextStyle(
                    fontSize: 60,
                    color: Colors.redAccent,
                  ),
                ),
              ),
//              _buildListWidget(),
            ],
          ),
        ));
  }

  ///创建list表的item
  Widget _buildListWidget() {
    var list = Arrays.drawerList;
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _buildItemRow(list[index], index);
        });
  }

  Widget _buildItemRow(HomePageModel model, int index) {
    return ListTile(
        leading: Hero(
          tag: "book" + index.toString(),
          child: Icon(
            model.icon,
            color: Colors.amberAccent,
          ),
        ),
        title: Text(model.labelTxt),
        subtitle: Text(model.labelTxt.substring(0, 1)),
        onTap: () {
          _onTapPress1(model, index);
        });
  }

  _onTapPress1(HomePageModel model, int index) {}

  Widget buildTabView(BuildContext context, HomePageModel page) {
    String labelId = page.labelTxt;
    switch (labelId) {
      case Strings.titleHome:
        return MainPage();
      case Strings.titleMe:
        return MePage();
      default:
        return Container();
    }
  }

  @override
  void dispose() {
    super.dispose();

    _tabController.dispose();
  }
}
