import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../services/firebase_detail.dart';

class SignUpProvider extends ChangeNotifier {
  // ? for Firestore
  cartAddData(email, name) {
    FireBaseServiceDetail.firebaseFirestore.doc("/Users/$email").set({
      "id": email,
      "name": name,
      "createAt": FieldValue.serverTimestamp(),
      "img": "",
      
      "address":"",
    });
    notifyListeners();
  }

  
}
