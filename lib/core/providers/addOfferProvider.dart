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
  int perPageItem = 6;
  int pageCount;
  int selectedIndex = 0;
  int lastPageItemLength;
  PageController pageController;
  bool isInteger(num value) => value is int || value == value.roundToDouble();

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
  List categories = ["1", "2", "3", "4", "5", "6", "7"];

  setUpCategoris() {
    pageController = PageController(initialPage: 0);

    var num = (categories.length / perPageItem);
    pageCount = isInteger(num) ? num.round() : num.toInt() + 1;

    var reminder = categories.length.remainder(perPageItem);
    lastPageItemLength = reminder == 0 ? perPageItem : reminder;
  }

  onCateoriesPageChange(index) {
    selectedIndex = index;
    notifyListeners();
  }

  changeSlider(i) {
    currentSliderIndex = i;
    notifyListeners();
  }

  addImage({selectedImage}) {
    if (img2 == null) {
      img2 = selectedImage;
    } else if (img3 == null) {
      img3 = selectedImage;
    } else if (img4 == null) {
      img4 = selectedImage;
    }

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
