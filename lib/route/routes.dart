import 'package:blood_donation/page/Auth/login_page.dart';
import 'package:blood_donation/route/route_handles.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String login = "/login";
  static String register = "/register";
  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return LoginPage();
    });
    router.define(root, handler: splashHandler);
    // router.define(login, handler: loginHandler);
    // router.define(register, handler: registerHandler);
    router.define(home, handler: homeHandler);
  }
}
