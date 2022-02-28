import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/sizeconfig.dart';
import '../../../provider/them_provider.dart';

class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: he(25), bottom: he(16)),
          child: Text(
            "Welcome",
            style: TextStyle(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "poppins"),
          ),
        ),
        Text(
          "Welcome to Organico Mobile Apps. Please fill in the field below to sign in.",
          style: TextStyle(
            color: textColor,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
