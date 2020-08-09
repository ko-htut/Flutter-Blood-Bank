import 'package:blood_donation/page/home/home_page.dart';
import 'package:blood_donation/page/splashscreen.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

var splashHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return SplashScreen();
});

var homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return HomePage();
});