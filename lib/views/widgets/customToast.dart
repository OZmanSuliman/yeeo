import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

customToast(text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.redAccent,
      textColor: Colors.white,
      fontSize: 16.0);
}
