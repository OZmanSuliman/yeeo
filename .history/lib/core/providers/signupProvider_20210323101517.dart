import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mytest/core/database/database_helper.dart';
import 'package:mytest/views/pages/home.dart';
import 'package:mytest/views/widgets/dialogs.dart';
import 'package:page_transition/page_transition.dart';

class SignUpProvider extends ChangeNotifier {
  final dbHelper = DatabaseHelper.instance;
  final signFormKey = GlobalKey<FormState>();
  final phoneFormKey = GlobalKey<FormState>();
  final addressFormKey = GlobalKey<FormState>();
  var allUsers;
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
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
    _insert(json.encode(phones), json.encode(addresses), context);
  }

  void _insert(phonesMap, addressMap, context) async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnFirstName: firstNameController.text,
      DatabaseHelper.columnLastName: lastNameController.text,
      DatabaseHelper.columnEmail: emailController.text,
      DatabaseHelper.columnPassword: passwordController.text,
      DatabaseHelper.columnGender: type,
      DatabaseHelper.columnPhones: phonesMap,
      DatabaseHelper.columnAddresses: addressMap,
      DatabaseHelper.columnImage: img.path,
      DatabaseHelper.columnBirth: birthdayController.text,
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
    _query(context);
  }

  void _query(context) async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
    allUsers = allRows;
    Navigator.pushReplacement(
        context,
        PageTransition(
            type: PageTransitionType.fade,
            child: HomePage(
              email: emailController.text,
            )));
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

  addPhone() {
    if (phoneController.text.isNotEmpty) {
      phones.add(phoneController.text);

      phoneController.clear();
      notifyListeners();
    } else {}
  }

  deletePhone(index) {
    phones.removeAt(index);
    notifyListeners();
  }

  addAddress() {
    if (addressController.text.isNotEmpty) {
      addresses.add(addressController.text);

      addressController.clear();
      notifyListeners();
    }
  }

  deleteAddress(index) {
    addresses.removeAt(index);
    notifyListeners();
  }

  selectGender(selectedType) {
    type = type;
    notifyListeners();
  }
}
