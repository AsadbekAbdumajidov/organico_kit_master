import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../components/sizeconfig.dart';
import '../../../core/color_const.dart';
import '../../../provider/them_provider.dart';

class PoppeyWidget extends StatelessWidget {
  const PoppeyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: he(10)),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: ConstColor.buttomColor.withOpacity(0.3),
            child: Center(
              child: SvgPicture.asset(
                "assets/svg/true - Home.svg",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: wi(10)),
            child: Text(
              "Poppey shop - New York",
              style: TextStyle(
                  color: textColor,
                  fontFamily: "poppins",
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
