import 'package:flutter/material.dart';
import '../services/firebase_detail.dart';

class FromCateToTheCartProvider extends ChangeNotifier {
  // ? for Firestore
  categCartAddData(String nomi, String img,String shop,String price) {
    FireBaseServiceDetail.firebaseFirestore.doc("/Cart/$nomi").set({
      "name": nomi,
      "price": price,
      "shop": shop,
      "img": img,
    });
    notifyListeners();
  }
}
