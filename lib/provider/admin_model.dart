import 'dart:convert';

import 'package:blood_donation/model/admin_model.dart';
import 'package:blood_donation/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../application.dart';
import '../utils/net_utils.dart';

class AdminModel with ChangeNotifier {
  Admin _admin;

  Admin get admin => _admin;

  void initUser() {
    if (Application.sp.containsKey('admin')) {
      String s = Application.sp.getString('admin');
      _admin = Admin.fromJson(json.decode(s));
    }
  }

  Future<Admin> login(BuildContext context, String phone, String pwd) async {

    Admin admin = await NetUtils.login(context, phone, pwd);
    Utils.showToast(admin.status.toString());
    _saveUserInfo(admin);
    return admin;
  }

  _saveUserInfo(Admin admin) {
    _admin = admin;
    Application.sp.setString('admin', json.encode(admin.toJson()));
  }
}