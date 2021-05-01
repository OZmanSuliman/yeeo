import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mytest/core/database/database_helper.dart';
import 'package:mytest/views/pages/login.dart';
import 'package:page_transition/page_transition.dart';

class HomeProvider extends ChangeNotifier {
  final dbHelper = DatabaseHelper.instance;
  var allUsers, user;
  var firstname, lastname, phones = "", addresses = "", img, birthday;
  getUser(email) async {
    final List<Map<String, Object>> allRows = await dbHelper.queryAllRows();
    allUsers = allRows;
    for (int i = 0; i < allUsers.length; i++) {
      if (allUsers[i]["email"] == email) {
        user = allUsers[i];
      }
    }
    firstname = user["firstName"];
    lastname = user["lastName"];
    img = user["image"];
    birthday = user["birth"];
    List userPhones = json.decode(user["phones"]);
    for (int i = 0; i < userPhones.length; i++) {
      if (i != userPhones.length - 1) {
        phones = phones + userPhones[i] + "  -  ";
      } else {
        phones = phones + userPhones[i];
      }
    }
    List userAddresses = json.decode(user["addresses"]);

    for (int i = 0; i < userAddresses.length; i++) {
      if (i != userAddresses.length - 1) {
        addresses = addresses + userAddresses[i] + "  -  ";
      } else {
        addresses = addresses + userAddresses[i];
      }
    }
    saveMyUser(user);
    notifyListeners();
  }

  void saveMyUser(user) async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnFirstName: user["firstName"],
      DatabaseHelper.columnLastName: user["lastName"],
      DatabaseHelper.columnEmail: user["email"],
      DatabaseHelper.columnPassword: user["password"],
      DatabaseHelper.columnGender: user["gender"],
      DatabaseHelper.columnPhones: json.encode(user["phones"]),
      DatabaseHelper.columnAddresses: json.encode(user["addresses"]),
      DatabaseHelper.columnImage: user["image"],
      DatabaseHelper.columnBirth: user["birth"],
    };
    final id = await dbHelper.saveMyUser(row);
    print('inserted row id: $id');
  }

  logout(context) {
    dbHelper.delete(0);
    Navigator.pushReplacement(context,
        PageTransition(type: PageTransitionType.fade, child: LoginPage()));
  }
}
