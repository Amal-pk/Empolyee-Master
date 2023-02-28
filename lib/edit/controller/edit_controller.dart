import 'package:flutter/material.dart';

class EditController extends ChangeNotifier {


  String? mobileValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "please enter your passwoed";
    } else if (value.length < 10) {
      return "To short password";
    } else {
      return null;
    }
  }
}
