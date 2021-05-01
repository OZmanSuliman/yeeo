import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mytest/views/pages/home.dart';
import 'package:mytest/views/widgets/dialogs.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpProvider extends ChangeNotifier {
  final signFormKey = GlobalKey<FormState>();
  var allUsers;
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  List<String> phones = [];
  List<String> addresses = [];

  var type = "male";
  File img;
  int isImage = 0;
  pickerGallary(int indx) async {
    print('Picker is called');

    if (indx == 0) {
      img = await ImagePicker.pickImage(
          source: ImageSource.camera, imageQuality: 20);
    } else {
      img = await ImagePicker.pickImage(
          source: ImageSource.gallery, imageQuality: 20);
    }
    if (img != null) {
      isImage = 1;
      notifyListeners();
    } else {
      isImage = 0;
      notifyListeners();
    }
  }

  onSignUp(context) {
    final Map phonesMap = new Map();
    if (phones.length > 0) {
      for (int i = 0; i < phones.length; i++) {
        phonesMap["phone$i"] = phones[i];
      }
    }

    final Map addressMap = new Map();

    if (addresses.length > 0) {
      for (int i = 0; i < addresses.length; i++) {
        addressMap["address$i"] = addresses[i];
      }
    }

    final Map data = new Map();
    data['fName'] = fNameController.text;
    data['lName'] = lNameController.text;
    data['email'] = emailController.text;
    data['password'] = passwordController.text;
    data['gender'] = type;
    data["phones"] = phonesMap;
    data["addresses"] = addressMap;
    data["img"] = img.path;
    data["birth"] = birthdayController.text;

    // String jsonData = json.encode(data);
    saveUser(data, context);
  }

  saveUser(user, context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    int indx = allUsers.length;
    allUsers["user$indx"] = user;
    pref.setString('users', json.encode(allUsers));

    Navigator.pushReplacement(
        context,
        PageTransition(
            type: PageTransitionType.fade,
            child: HomePage(
              email: emailController.text,
            )));
  }

  getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    allUsers = json.decode(pref.getString("users"));
    notifyListeners();
  }

  Future selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950, 8),
        lastDate: DateTime(2101));
    if (picked != null) selectedDate = picked;
    birthdayController.text = selectedDate.day.toString() +
        " - " +
        selectedDate.month.toString() +
        " - " +
        selectedDate.year.toString();
    notifyListeners();
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

  deletePhone(index) {
    phones.removeAt(index);
    notifyListeners();
  }

  deleteAddress(index) {
    addresses.removeAt(index);
    notifyListeners();
  }
}
