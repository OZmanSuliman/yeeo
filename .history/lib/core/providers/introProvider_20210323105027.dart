import 'package:flutter/material.dart';
import 'package:moon/core/database/database_helper.dart';
import 'package:moon/views/pages/home.dart';
import 'package:moon/views/pages/login.dart';
import 'package:page_transition/page_transition.dart';

class IntroProvider extends ChangeNotifier {
  final dbHelper = DatabaseHelper.instance;
  checkLoginStatus(context) async {
    try {
      final List<Map<String, Object>> myUser = await dbHelper.getMyUser();
      if (myUser != null) {
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                child: HomePage(
                  email: myUser[0]["email"],
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
