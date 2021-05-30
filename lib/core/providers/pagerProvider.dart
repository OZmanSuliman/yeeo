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
import 'package:flutter/material.dart';

class PagerProvider extends ChangeNotifier {
  PageController tabController;

  int bottomSelectedIndex = 0;
  init() {}
  onTap(index) {
    bottomSelectedIndex = index;
    tabController.animateToPage(
      bottomSelectedIndex,
      duration: Duration(microseconds: 1),
      curve: Curves.ease,
    );
    notifyListeners();
  }
}
