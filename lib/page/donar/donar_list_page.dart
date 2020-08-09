import 'package:ant_icons/ant_icons.dart';
import 'package:blood_donation/utils/navigator_util.dart';
import 'package:flutter/material.dart';

class DonarListPage extends StatefulWidget {
  DonarListPage({Key key}) : super(key: key);

  @override
  _DonarListPageState createState() => _DonarListPageState();
}

class _DonarListPageState extends State<DonarListPage> {
  Widget _item() {
    return Card(
      elevation: 0,
      child: GestureDetector(
        onTap: () {
          NavigatorUtil.goUserProfilePage(context);
        },
        child: Container(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Container(
                    height: 80,
                    width: 80,
                    child: Image(
                        image: NetworkImage(
                            "https://i.pinimg.com/236x/dd/f9/17/ddf917e7b4dae879a1386f87d14b7152.jpg")),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Eromanga Sensei"),
                          Text("Japan"),
                          Text("AB +", style: TextStyle(color: Colors.red)),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  child: Column(
                    children: [
                      Container(
                        height: 45,
                        width: 100,
                        color: Colors.green,
                        child: Icon(AntIcons.phone_outline),
                      ),
                      Container(
                        height: 45,
                        width: 100,
                        color: Colors.blueGrey,
                        child: Icon(AntIcons.message_outline),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _item(),
            _item(),
            _item(),
            _item(),
            _item(),
            _item(),
            _item(),
            _item(),
            _item(),
            _item(),
          ],
        ),
      ),
    );
  }
}
