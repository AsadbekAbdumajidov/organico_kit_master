import 'package:flutter/material.dart';

class PriceAddRemoveProvider extends ChangeNotifier {
  int sanoq = 1;
  int jamiPrice = 0;
  priceAdd(price) {
    sanoq += 1;
    jamiPrice = price * sanoq;
    notifyListeners();
  }


  priceRemove(price) {
    sanoq -= 1;
    jamiPrice = price * sanoq;
    notifyListeners();
  }
}
