import 'package:flutter/material.dart';

class NotifProvider extends ChangeNotifier {
  bool notifification = false;
  tap() {
    notifification = !notifification;
    notifyListeners();
  }
}