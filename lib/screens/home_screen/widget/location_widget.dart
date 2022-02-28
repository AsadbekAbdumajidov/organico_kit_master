import 'package:flutter/material.dart';
import 'package:organico_kit_master/core/sign_const.dart';
import 'package:provider/provider.dart';

import '../../../components/sizeconfig.dart';
import '../../../provider/them_provider.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    return Padding(
      padding: EdgeInsets.only(top: he(40)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Your Location",
            style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontFamily: "nunito",
                fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/edit',arguments: 0);
                },
                child: Text(
                  EditConst.adress.text.isEmpty ? "Tashkent/Uzbekistan":EditConst.adress.text,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: textColor,
                      fontSize: 16,
                      fontFamily: "poppins"),
                ),
              ),
              Icon(
                Icons.arrow_drop_down_outlined,
                color: textColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
