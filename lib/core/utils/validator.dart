import 'package:easy_localization/easy_localization.dart';

class Validator {
  static String validateName(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Name is Required".tr();
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z".tr();
    }
    return null;
  }

  static String validateDOB(String value) {
    if (value.isEmpty) {
      return "This field can't be empty".tr();
    }
    return null;
  }

  static String validateAddress(String value) {
    if (value.length == 0) {
      return "Address is Required".tr();
    }
    return null;
  }

  static String validateMobile(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Mobile is Required".tr();
    } else if (value.length != 10) {
      return "Mobile number must 10 digits".tr();
    } else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits".tr();
    }
    return null;
  }

  static String validatePasswordLength(String value) {
    if (value.length == 0) {
      return "Password can't be empty".tr();
    } else if (value.length < 6) {
      return "Password must be longer than 6 characters".tr();
    }
    return null;
  }

  static String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required".tr();
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email".tr();
    }
    return null;
  }
}
