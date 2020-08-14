import 'package:ant_icons/ant_icons.dart';
import 'package:blood_donation/model/donar_list_model.dart';
import 'package:blood_donation/utils/navigator_util.dart';
import 'package:blood_donation/utils/net_utils.dart';
import 'package:blood_donation/widget/common_text_style.dart';
import 'package:blood_donation/widget/widget_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DonarListPage extends StatefulWidget {
  DonarListPage({Key key}) : super(key: key);

  @override
  _DonarListPageState createState() => _DonarListPageState();
}

class _DonarListPageState extends State<DonarListPage> {
  Widget _item(Datum datum) {
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
                // https://mohnyin.net/images/donar/1596977054_donar.jpg
                Padding(
                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Container(
                    height: 80,
                    width: 80,
                    child: Image(
                        image: NetworkImage(
                            "https://mohnyin.net/images/donar/${datum.image}"),fit: BoxFit.fill,),
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
                          Text(datum.name),
                          Text(datum.city),
                          Text(datum.bloodType, style: TextStyle(color: Colors.red)),
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
          child: CustomFutureBuilder<DonarList>(
        futureFunc: NetUtils.getdonarlist,
        builder: (context, data) {
          return Container(
            child: Column(
              children: data.data.map((e) => (_item(e))).toList(),
            ),
          );
        },
      )),
    );
  }
}
