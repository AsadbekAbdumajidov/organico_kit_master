import 'package:flutter/material.dart';
import '../../../core/color_const.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, "/bottomNAvBar", (route) => false);
          },
          child: Text(
            "Forgot Password",
            style: TextStyle(
                color: ConstColor.buttomColor,
                fontWeight: FontWeight.normal,
                fontFamily: "poppins",
                fontSize: 13),
          ),
        ),
      ],
    );
  }
}
