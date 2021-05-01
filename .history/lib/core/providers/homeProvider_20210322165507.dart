import 'package:flutter/material.dart';
import 'package:mytest/core/database/database_helper.dart';

class HomeProvider extends ChangeNotifier {
  final dbHelper = DatabaseHelper.instance;
  var allUsers, user;
  var firstname, lastname, phones = "", addresses = "", img, email, birthday;
  getUser() async {
    final List<Map<String, Object>> allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));

    allUsers = allRows.first;
    for (int i = 0; i < allUsers.length; i++) {
      if (allUsers['columns']["user$i"]["email"] == email) {
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
