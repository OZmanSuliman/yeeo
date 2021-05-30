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

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yeeo/views/pages/auth/login.dart';
import 'package:yeeo/views/pages/main/pager.dart';

class SplashProvider extends ChangeNotifier {
  checkLoginStatus(context) async {
    try {
      addTestAccount();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await loadImages(context);
      bool isLogged = prefs.getBool("logged") ?? false;
      // prefs.setBool("logged", true);
      if (isLogged) {
        Navigator.push(context,
            PageTransition(type: PageTransitionType.fade, child: Pager()));
      } else {
        Navigator.push(context,
            PageTransition(type: PageTransitionType.fade, child: LoginPage()));
      }
    } catch (e) {
      Navigator.push(context,
          PageTransition(type: PageTransitionType.fade, child: LoginPage()));
    }
  }

  loadImages(context) async {
    await precacheImage(
        AssetImage('assets/images/addOfferBanner.png'), context);
  }

  addTestAccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> testAccount = {
      "password": '123456',
      "email": 'test@gmail.com',
    };
    prefs.setString("user", json.encode(testAccount));
  }
}
