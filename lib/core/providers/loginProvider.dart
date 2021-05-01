import 'package:flutter/material.dart';
import 'package:yeeo/core/database/database_helper.dart';
import 'package:yeeo/views/pages/home.dart';
import 'package:yeeo/views/widgets/dialogs.dart';
import 'package:page_transition/page_transition.dart';

class LoginProvider extends ChangeNotifier {
  final loginFormKey = GlobalKey<FormState>();
  final dbHelper = DatabaseHelper.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var allUsers, user;

  login(context) async {
    final List<Map<String, Object>> allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
    allUsers = allRows;
    if (loginFormKey.currentState.validate()) {
      for (int i = 0; i < allUsers.length; i++) {
        if (allUsers[i]["email"] == emailController.text) {
          user = allUsers[i];
        }
      }
      if (user != null) {
        if (user["email"] == emailController.text &&
            user["password"] == passwordController.text) {
          Navigator.pushReplacement(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  child: HomePage(
                    email: emailController.text,
                  )));
        } else {
          Dialogs d = new Dialogs();
          d.wrong(
              "Wrong cereditials!\nplease enter a correct username and password then try again",
              context);
        }
      } else {
        Dialogs d = new Dialogs();
        d.wrong("Wrong cereditials!\nThis user doesn't exist", context);
      }
    }
  }
}
