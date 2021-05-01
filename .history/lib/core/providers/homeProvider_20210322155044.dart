import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mytest/views/pages/home.dart';
import 'package:mytest/views/widgets/dialogs.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends ChangeNotifier {
  var allUsers, user;
  var firstname, lastname, phones = "", addresses = "", img, email, birthday;
  getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    allUsers = json.decode(pref.getString("users"));
    for (int i = 0; i < allUsers.length; i++) {
      if (allUsers["user$i"]["email"] == email) {
        user = allUsers["user$i"];
      }
    }
    firstname = user["fName"];
    lastname = user["lName"];
    img = user["img"];
    birthday = user["birth"];

    for (int i = 0; i < user["phones"].length; i++) {
      if (i != user["phones"].length - 1) {
        phones = phones + user["phones"]["phone$i"] + "  -  ";
      } else {
        phones = phones + user["phones"]["phone$i"];
      }
    }

    for (int i = 0; i < user["addresses"].length; i++) {
      if (i != user["addresses"].length - 1) {
        addresses = addresses + user["addresses"]["address$i"] + "  -  ";
      } else {
        addresses = addresses + user["addresses"]["address$i"];
      }
    }
    notifyListeners();
  }
}
