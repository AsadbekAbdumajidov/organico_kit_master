import 'package:flutter/material.dart';

class EyeProvider extends ChangeNotifier {
  bool boolean = false;

  eyefunc() {
    boolean == true ? boolean = false : boolean = true;
    notifyListeners();
  }
}
