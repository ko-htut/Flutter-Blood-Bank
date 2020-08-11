import 'package:blood_donation/model/admin_model.dart';
import 'package:blood_donation/utils/utils.dart';
import 'package:blood_donation/widget/loading.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
    bool isShowLoading = true,
    dynamic data,
  }) async {
    if (isShowLoading) Loading.showLoading(context);
    try {
      return await _dio.post(
        "$baseUrl$url",
        data: data,
      );
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
    // Response tresponse =
    //     await Dio().post("https://mohnyin.net/api/v1/admin/login", data: {
    //   'email': email,
    //   'password': password,
    // });
    print(response);
    return Admin.fromJson(response.data);
  }
}
