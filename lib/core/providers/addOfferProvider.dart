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
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yeeo/views/pages/auth/login.dart';
import 'package:yeeo/views/pages/offer/offerPage.dart';

class AddOfferProvider extends ChangeNotifier {
  final homeFormKey = GlobalKey<FormState>();
  String selectedCity;
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

  userLogged() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('logged', true);
  }

  int currentSliderIndex = 0;
  List categories = [
    "1",
    "2",
    "3",
    "4",
    "5",
  ];
  changeSlider(i) {
    currentSliderIndex = i;
    notifyListeners();
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

  changeCity(newCity) {
    selectedCity = newCity;
    notifyListeners();
  }

  send(context) {
    Navigator.pushReplacement(context,
        PageTransition(type: PageTransitionType.fade, child: OfferPage()));
  }
}
