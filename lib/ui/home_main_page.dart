import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_azhansy_app/base/fab_bottom_app_bar.dart';
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
          //view
          body: TabBarView(
            controller: _tabController,
            children: _allPage
                .map((HomePageModel model) => buildTabView(context, model))
                .toList(),
          ),
          bottomNavigationBar: FABBottomAppBar(
              selectedColor: Theme.of(context).primaryColor,
              onTabSelected: (int index) {
                _tabController.animateTo(index);
              },
              items: _allPage
                  .map((HomePageModel page) => FABBottomAppBarItem(
                      iconData: page.icon, text: page.labelTxt))
                  .toList()),
        ));
  }

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
