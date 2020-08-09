import 'package:ant_icons/ant_icons.dart';
import 'package:blood_donation/page/dashboard/dashboard_page.dart';
import 'package:blood_donation/page/donar/donar_list_page.dart';
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
        actions: [
          Container(
            width: 35,
            height: 50,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                // color: Colors.redAccent,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                      "https://i.pinimg.com/236x/dd/f9/17/ddf917e7b4dae879a1386f87d14b7152.jpg",
                    ),
                    fit: BoxFit.fill)),
            // child: Padding(
            //   padding: const EdgeInsets.all(5.0),
            //   child: Icon(
            //     AntIcons.user,
            //     color: Colors.white,
            //   ),
            // ),
          )
        ],
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
                    children: [DashboardPage(), DonarListPage()],
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
