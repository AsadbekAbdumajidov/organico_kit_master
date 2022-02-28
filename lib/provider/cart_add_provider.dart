import 'package:flutter/material.dart';
import '../services/firebase_detail.dart';

class CartProvider extends ChangeNotifier {
  // ? for Firestore
  cartAddData(data) {
    FireBaseServiceDetail.firebaseFirestore.doc("/Cart/${data["name"]}").set({
      "name": data["name"],
      "price": data["price"],
      "shop": data["shop"],
      "img": data["img"],
    });
    notifyListeners();
  }

  cartRemoveData(name) {
    FireBaseServiceDetail.firebaseFirestore
        .doc("/Cart/$name")
        .delete()
        .whenComplete(() => null);
    notifyListeners();
  }
}
