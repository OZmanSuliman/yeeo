import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yeeo/views/pages/login.dart';

class HomeProvider extends ChangeNotifier {
  logout(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.pushReplacement(context,
        PageTransition(type: PageTransitionType.fade, child: LoginPage()));
  }
}
