import 'dart:io';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yeeo/views/pages/auth/login.dart';
import 'package:yeeo/views/pages/offer/offerPage.dart';

class HomeProvider extends ChangeNotifier {
  final homeFormKey = GlobalKey<FormState>();

  TextEditingController noteController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController budgetController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  File img1;
  File img2;
  File img3;
  File img4;
  logout(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.pushReplacement(context,
        PageTransition(type: PageTransitionType.fade, child: LoginPage()));
  }

  updateImage({selectedImage, index}) {
    switch (index) {
      case 0:
        img1 = selectedImage;
        break;
      case 1:
        img2 = selectedImage;
        break;
      case 2:
        img3 = selectedImage;
        break;
      case 3:
        img4 = selectedImage;
        break;
      default:
    }
    notifyListeners();
  }

  send(context) {
    Navigator.pushReplacement(context,
        PageTransition(type: PageTransitionType.fade, child: OfferPage()));
  }
}
