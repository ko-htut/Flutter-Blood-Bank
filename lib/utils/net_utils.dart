import 'dart:io';

import 'package:blood_donation/model/admin_model.dart';
import 'package:blood_donation/model/donar_list_model.dart';
import 'package:blood_donation/provider/admin_model.dart';
import 'package:blood_donation/utils/utils.dart';
import 'package:blood_donation/widget/loading.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../application.dart';
import '../route/navigate_service.dart';
import '../route/routes.dart';

class NetUtils {
  static Dio _dio;
  static final String baseUrl = "https://mohnyin.net/api/v1/admin/";

  static Future<Response> _post(
    BuildContext context,
    String url, {
    Map<String, dynamic> params,
    dynamic data,
    Options options,
    bool isShowLoading = true,
  }) async {
    if (isShowLoading) Loading.showLoading(context);
    try {
      return await _dio.post("$baseUrl$url",
          queryParameters: params, data: data, options: options);
    } on DioError catch (e) {
      if (e == null) {
        return Future.error(Response(data: -1));
      } else if (e.response != null) {
        if (e.response.statusCode >= 300 && e.response.statusCode < 400) {
          _reLogin();
          return Future.error(Response(data: -1));
        } else {
          return Future.value(e.response);
        }
      } else {
        return Future.error(Response(data: -1));
      }
    } finally {
      Loading.hideLoading(context);
    }
  }

  static void _reLogin() {
    Future.delayed(Duration(milliseconds: 200), () {
      Application.getIt<NavigateService>().popAndPushNamed(Routes.login);
      Utils.showToast('登录失效，请重新登录');
    });
  }

  static Future<Admin> login(
      BuildContext context, String email, String password) async {
    print("$email : $password");
    var response = await _post(context, 'login', data: {
      'email': email,
      'password': password,
    });
    print(response);
    return Admin.fromJson(response.data);
  }

  // ignore: missing_return
  static Future<DonarList> getdonarlist(
    BuildContext context,
  ) async {
    AdminModel adminModel = Provider.of<AdminModel>(context);
    adminModel.initUser(context);
    String token = adminModel.admin.data.token;
    Loading.showLoading(context);
    try {
      Loading.showLoading(context);
      Response response = await Dio().post(
          "https://mohnyin.net/api/v1/admin/donar/list",
          options: Options(
              headers: {HttpHeaders.authorizationHeader: "Bearer $token"}));
      return DonarList.fromJson(response.data);
    } on DioError catch (e) {
      print("error $e");
    } finally {
      Loading.hideLoading(context);
    }
  }
}
