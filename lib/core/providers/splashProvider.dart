import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yeeo/views/pages/auth/login.dart';
import 'package:yeeo/views/pages/main/pager.dart';

class SplashProvider extends ChangeNotifier {
  checkLoginStatus(context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await loadImages(context);
      dynamic myUser = prefs.getString("user");
      myUser = json.decode(myUser);
      if (myUser != null) {
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
    await precacheImage(AssetImage('assets/images/duration.png'), context);
    await precacheImage(AssetImage('assets/images/addImg.png'), context);
    await precacheImage(AssetImage('assets/images/addOffer.png'), context);
    await precacheImage(
        AssetImage('assets/images/addOfferBanner.png'), context);
    await precacheImage(AssetImage('assets/images/apple.png'), context);
    await precacheImage(AssetImage('assets/images/background.png'), context);
    await precacheImage(AssetImage('assets/images/basket.png'), context);
    await precacheImage(AssetImage('assets/images/budget.png'), context);
    await precacheImage(AssetImage('assets/images/icon.png'), context);
    await precacheImage(AssetImage('assets/images/location.png'), context);
    await precacheImage(AssetImage('assets/images/logo_text.png'), context);
    await precacheImage(AssetImage('assets/images/logo_white.png'), context);
    await precacheImage(AssetImage('assets/images/logo.png'), context);
  }
}
