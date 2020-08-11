import 'package:blood_donation/model/admin_model.dart';
import 'package:blood_donation/utils/utils.dart';
import 'package:blood_donation/widget/loading.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../application.dart';
import '../route/navigate_service.dart';
import '../route/routes.dart';
import 'config.dart';

class NetUtils {
  static Dio _dio;
  static final String baseUrl = Configs.rooturl;

  static void init() async {}

  static Future<Response> _get(
    BuildContext context,
    String url, {
    Map<String, dynamic> params,
    bool isShowLoading = true,
  }) async {
    if (isShowLoading) Loading.showLoading(context);
    try {
      return await _dio.get(url, queryParameters: params);
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

  /// 登录
  static Future<Admin> login(
      BuildContext context, String phone, String password) async {
    var response = await _get(context, '/login', params: {
      'phone': phone,
      'password': password,
    });
    return Admin.fromJson(response.data);
  }
}
