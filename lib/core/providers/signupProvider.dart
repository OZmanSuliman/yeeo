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

class SignUpProvider extends ChangeNotifier {
  final signFormKey = GlobalKey<FormState>();
  final phoneFormKey = GlobalKey<FormState>();
  final addressFormKey = GlobalKey<FormState>();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool accepted = false;
  onTapAcceept() {
    accepted = !accepted;
    notifyListeners();
  }

  void signup(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> newUser = {
      "userName": userNameController.text,
      "email": emailController.text,
      "password": passwordController.text
    };
    prefs.setString("user", json.encode(newUser));
    Navigator.pushReplacement(
        context, PageTransition(type: PageTransitionType.fade, child: Pager()));
  }

  onSignUpTap(context) {
    if (signFormKey.currentState.validate()) {
      if (accepted != true) {
        Dialogs d = new Dialogs();
        d.wrong(
            "you must accept the Terms & Conditions to create an account".tr(),
            context);
      }
      if (passwordController.text != confirmPasswordController.text) {
        Dialogs d = new Dialogs();
        d.wrong("password dosn't match".tr(), context);
      } else {
        signup(context);
      }
    }
  }
}
