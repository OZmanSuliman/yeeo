import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mytest/core/database/database_helper.dart';

class HomeProvider extends ChangeNotifier {
  final dbHelper = DatabaseHelper.instance;
  var allUsers, user;
  var firstname, lastname, phones = "", addresses = "", img, birthday;
  getUser(email) async {
    final List<Map<String, Object>> allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));

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
