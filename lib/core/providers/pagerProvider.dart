import 'package:flutter/material.dart';

class PagerProvider extends ChangeNotifier {
  TabController tabController;

  int bottomSelectedIndex = 0;
  init() {}
  onTap(index) {
    bottomSelectedIndex = index;
    tabController.animateTo(bottomSelectedIndex);
    notifyListeners();
  }
}
