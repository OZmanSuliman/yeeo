import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yeeo/views/pages/auth/login.dart';

class Basket extends StatefulWidget {
  Basket();
  @override
  _BasketState createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
        onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.clear();
          Navigator.pushReplacement(
              context,
              PageTransition(
                  type: PageTransitionType.fade, child: LoginPage()));
        },
        child: Text("log out"),
      )),
    );
  }
}
