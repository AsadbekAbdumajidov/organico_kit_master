import 'package:flutter/material.dart';

import '../core/sign_const.dart';
import '../services/firebase_detail.dart';

class EditeProvider extends ChangeNotifier {
  edit() {
    FireBaseServiceDetail.firebaseFirestore
        .doc("/Users/${FireBaseServiceDetail.authUser.currentUser!.email}")
        .update({
      "name": EditConst.name.text,
      "phone": EditConst.phone.text,
      "address": EditConst.adress.text
    });
    notifyListeners();
  }
}
