import 'package:blood_donation/page/Auth/login_page.dart';
import 'package:blood_donation/page/Auth/register_page.dart';
import 'package:blood_donation/page/home/home_page.dart';
import 'package:blood_donation/page/profile/profile_page.dart';
import 'package:blood_donation/page/profile/user_profile.dart';
import 'package:blood_donation/page/splashscreen.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

var splashHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return SplashScreen();
});

var loginHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return LoginPage();
});

var registerHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return RegisterPage();
});

var homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return HomePage();
});

var profileHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return ProfilePage();
});

var userprofileHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return UserProfilePage();
});
