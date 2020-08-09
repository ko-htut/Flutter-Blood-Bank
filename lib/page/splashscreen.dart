import 'package:ant_icons/ant_icons.dart';
import 'package:blood_donation/application.dart';
import 'package:blood_donation/utils/navigator_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1000), () {
      goPage();
    });
  }

  void goPage() {
    NavigatorUtil.goHomePage(context);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    final size = MediaQuery.of(context).size;
    Application.screenWidth = size.width;
    Application.screenHeight = size.height;
    Application.statusBarHeight = MediaQuery.of(context).padding.top;
    Application.bottomBarHeight = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      AntIcons.alert_outline,
                      size: 45,
                      color: Colors.redAccent,
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Mohnyin Blood Bank",
                    style: TextStyle(color: Colors.redAccent, fontSize: 23),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Copyright©2020 Mohnyin Blood Bank"),
            ),
          ),
        ],
      ),
    );
  }
}
