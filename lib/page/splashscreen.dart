import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
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
              child: Text("Copyrightc2020 Mohnyin Blood Bank"),
            ),
          ),
        ],
      ),
    );
  }
}
