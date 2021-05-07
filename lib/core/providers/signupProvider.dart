import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yeeo/core/database/database_helper.dart';
import 'package:yeeo/views/pages/home.dart';
import 'package:yeeo/views/widgets/dialogs.dart';

class SignUpProvider extends ChangeNotifier {
  final signFormKey = GlobalKey<FormState>();
  final phoneFormKey = GlobalKey<FormState>();
  final addressFormKey = GlobalKey<FormState>();
  var allUsers;
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  List<String> phones = [];
  List<String> addresses = [];
  bool accepted = false;
  var type = "male";
  File img;
  int isImage = 0;
  onTapAcceept() {
    accepted = !accepted;
    notifyListeners();
  }

  onSignUp(context) {
    _insert(json.encode(phones), json.encode(addresses), context);
  }

  void _insert(phonesMap, addressMap, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> row = {
      "userName": userNameController.text,
      "email": emailController.text,
    };
    final id = prefs.setString("user", json.encode(row));
    print('inserted row id: $id');
    Navigator.pushReplacement(
        context,
        PageTransition(
            type: PageTransitionType.fade,
            child: HomePage(
              email: emailController.text,
            )));
  }

  onSignUpTap(context) {
    if (signFormKey.currentState.validate()) {
      if (img == null) {
        Dialogs d = new Dialogs();
        d.wrong("Please select an image", context);
      } else if (phones.length < 1) {
        Dialogs d = new Dialogs();
        d.wrong("Please add at least one phone number", context);
      } else if (addresses.length < 1) {
        Dialogs d = new Dialogs();
        d.wrong("Please add at least one address", context);
      } else {
        onSignUp(context);
      }
    }
  }
}
