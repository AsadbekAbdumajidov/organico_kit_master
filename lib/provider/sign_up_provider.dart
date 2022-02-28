import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../services/firebase_detail.dart';

class SignUpProvider extends ChangeNotifier {
  // ? for Firestore
  signUpFireStore(email, name) {
    FireBaseServiceDetail.firebaseFirestore.doc("/Users/$email").set({
      "id": email,
      "name": name,
      "createAt": FieldValue.serverTimestamp(),
      "img": "",
      "phone": "",
      "address":"",
    });
    notifyListeners();
  }

  // ? Autintification
  Future singUp(String e, String p) async {
    try {
      UserCredential _credential = await FireBaseServiceDetail.authUser
          .createUserWithEmailAndPassword(email: e, password: p);
      User? user = _credential.user;
      await user!.sendEmailVerification();
      debugPrint("User: ${user.email}");

      return user;
    } catch (e) {
      debugPrint("User error");

      return false;
    }
  }
}
