import 'package:blood_donation/route/routes.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../application.dart';

class NavigatorUtil {
  static _navigateTo(BuildContext context, String path,
      {bool replace = false,
      bool clearStack = false,
      Duration transitionDuration = const Duration(milliseconds: 250),
      RouteTransitionsBuilder transitionBuilder}) {
    Application.router.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder,
        transition: TransitionType.material);
  }

  static void goHomePage(BuildContext context) {
    _navigateTo(context, Routes.home, clearStack: true);
  }

  static void goLoginPage(BuildContext context) {
    _navigateTo(context, Routes.login, clearStack: true);
  }

  static void goRegisterPage(BuildContext context) {
    _navigateTo(context, Routes.register, clearStack: true);
  }

  static void goProfilePage(BuildContext context) {
    _navigateTo(context, Routes.profile, clearStack: false);
  }

  static void goUserProfilePage(BuildContext context) {
    _navigateTo(context, Routes.userprofile, clearStack: false);
  }
}
