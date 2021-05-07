import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yeeo/views/pages/home.dart';
import 'package:yeeo/views/pages/login.dart';
import 'package:page_transition/page_transition.dart';

class SplashProvider extends ChangeNotifier {
  checkLoginStatus(context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await Future.delayed(Duration(milliseconds: 500));
      dynamic myUser = prefs.getString("user");
      myUser = json.decode(myUser);
      if (myUser != null) {
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                child: HomePage(
                  email: myUser["email"],
                )));
      } else {
        Navigator.push(context,
            PageTransition(type: PageTransitionType.fade, child: LoginPage()));
      }
    } catch (e) {
      Navigator.push(context,
          PageTransition(type: PageTransitionType.fade, child: LoginPage()));
    }
  }
}
