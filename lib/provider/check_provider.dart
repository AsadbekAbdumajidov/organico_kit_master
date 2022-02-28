import 'package:flutter/material.dart';

class CheckProvider extends ChangeNotifier {
  bool isChecked = false;
  check() {
    isChecked = !isChecked;
    notifyListeners();
  }
}
