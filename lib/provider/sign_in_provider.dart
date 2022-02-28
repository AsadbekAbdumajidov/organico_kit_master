import 'package:flutter/material.dart';
import '../services/firebase_detail.dart';

class SignInProvider extends ChangeNotifier {
  Future signInFunction(String e, String p) async {
    try {
      await FireBaseServiceDetail.authUser.signInWithEmailAndPassword(
        email: e,
        password: p,
      );
      notifyListeners();
      return true;
    } catch (e) {
      notifyListeners();
      return false;
    }
  }
}
