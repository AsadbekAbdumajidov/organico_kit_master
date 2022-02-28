import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/color_const.dart';
import '../../../provider/check_provider.dart';
import '../../../provider/them_provider.dart';

class CheckboxWidget extends StatelessWidget {
  const CheckboxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    return CheckboxListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "I accept the",
            style: TextStyle(color: textColor, fontSize: 13),
          ),
          Text(
            " Terms of Use ",
            style: TextStyle(color: ConstColor.buttomColor, fontSize: 14),
          ),
          Text(
            "and",
            style: TextStyle(color: textColor, fontSize: 13),
          ),
          Text(
            " Privacy Policy",
            style: TextStyle(color: ConstColor.buttomColor, fontSize: 13),
          ),
        ],
      ),
      value: context.watch<CheckProvider>().isChecked,
      onChanged: (v) {
        context.read<CheckProvider>().check();
      },
    );
  }
}
