import 'package:flutter/material.dart';
import 'package:organico_kit_master/core/color_const.dart';

class DarkVsLightProvider extends ChangeNotifier {
  bool svichBool = false;
  ThemeData scaffoldColor = ConstColor.light;
  Color textColor = ConstColor.lightColor;
  void colorRef() {
    scaffoldColor == ConstColor.light
        ? scaffoldColor = ConstColor.dark
        : scaffoldColor = ConstColor.light;
    textColor == ConstColor.lightColor
        ? textColor = ConstColor.darkColor
        : textColor = ConstColor.lightColor;
    svichBool == true ? svichBool = false : svichBool = true;
    notifyListeners();
  }
}
