import 'package:flutter/material.dart';

class AnimateController extends ChangeNotifier {
  bool add = false;
  bool edit = false;
  bool delete = false;

  void isAdd() {
    add = !add;
    edit = false;
    delete = false;
    notifyListeners();
  }
}
