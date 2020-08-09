import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../application.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    new Tab(text: "Dashboard"),
    new Tab(text: "Donar List"),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mohnyin Blood Bank"),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(right: ScreenUtil().setWidth(350)),
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        isScrollable: true,
                        unselectedLabelColor: Colors.grey,
                        labelColor: Colors.white,
                        indicator: new BubbleTabIndicator(
                          indicatorHeight: 25.0,
                          indicatorColor: Colors.redAccent,
                          tabBarIndicatorSize: TabBarIndicatorSize.tab,
                        ),
                        tabs: tabs,
                        controller: _tabController,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: tabs.map((Tab tab) {
                      return new Center(
                          child: new Text(
                        tab.text,
                        style: new TextStyle(fontSize: 20.0),
                      ));
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
