/*
 *
 *    *****   ******
 *    *   *       *
 *    *   *      *
 *    *   *     *  
 *    *****    *****
 *
 * Created on Fri May 14 2021
 *
 * Copyright (c) 2021 Osman Suliman
 * oz.solomon99@gmail.com
 */
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yeeo/views/pages/main/pager.dart';
import 'package:yeeo/views/widgets/dialogs.dart';

class LoginProvider extends ChangeNotifier {
  final loginFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  int userType = 1;
  var allUsers, user;
  Animation arrowAnimation1;
  AnimationController arrowAnimationController1;

  Animation arrowAnimation2;
  AnimationController arrowAnimationController2;
  switchType(type) {
    userType = type;

    notifyListeners();
  }

  login(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    user = prefs.getString("user");
    user = json.decode(user);
    if (user != null) {
      if (user["email"] == emailController.text &&
          user["password"] == passwordController.text) {
        Navigator.pushReplacement(context,
            PageTransition(type: PageTransitionType.fade, child: Pager()));
      } else {
        Dialogs d = new Dialogs();
        d.wrong(
            "Wrong cereditials!\nplease enter a correct username and password then try again"
                .tr(),
            context);
      }
    } else {
      Dialogs d = new Dialogs();
      d.wrong("Wrong cereditials!\nThis user doesn't exist".tr(), context);
    }
  }
}
