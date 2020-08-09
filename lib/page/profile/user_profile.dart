import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfilePage extends StatefulWidget {
  UserProfilePage({Key key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Eromanga Sensei"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // color: Colors.white,
              height: ScreenUtil().setHeight(200),
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    width: ScreenUtil().setHeight(170),
                    height: ScreenUtil().setHeight(170),
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                              "https://i.pinimg.com/236x/dd/f9/17/ddf917e7b4dae879a1386f87d14b7152.jpg",
                            ),
                            fit: BoxFit.fill)),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Eromanga Sensei"),
                          Text("21 years"),
                          Text("09-777-363-991"),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue[100],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(" Japan "),
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                """  When I saw CV-Template the first time, I was surprised about how extensive and thoughtful the tool was. This is how a CV must look like, and if this tool was available 15 years ago, it would have made the lives of all those applicants a lot easier.
I recommend strongly to use a CV from CV-Template as the designs are exactly how a recruiter wants to see it.""",
                textAlign: TextAlign.left,
              ),
            )
          ],
        ),
      ),
    );
  }
}
