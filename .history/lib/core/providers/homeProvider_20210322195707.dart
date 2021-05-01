import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mytest/core/database/database_helper.dart';

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
    notifyListeners();
  }
}
