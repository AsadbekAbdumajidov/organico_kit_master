import 'package:flutter/material.dart';
import 'package:organico_kit_master/core/color_const.dart';
import 'package:provider/provider.dart';
import '../../../components/sizeconfig.dart';
import '../../../core/sign_const.dart';
import '../../../provider/eye_provider.dart';
import '../../../provider/them_provider.dart';

class FormSignInWidget extends StatelessWidget {
  const FormSignInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: he(30), bottom: he(18)),
          child: TextFormField(
            controller: SignInConst.login,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(40),
                  ),
                  borderSide: BorderSide(color: Colors.red.shade800),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
                prefixIcon: Icon(
                  Icons.attach_email,
                  color: ConstColor.buttomColor,
                ),
                hintText: "  Email"),
          ),
        ),
        TextFormField(
          controller: SignInConst.password,
          keyboardType: TextInputType.number,
          obscureText:
              context.watch<EyeProvider>().boolean == true ? true : false,
          decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(40),
                ),
                borderSide: BorderSide(color: Colors.red.shade800),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  context.read<EyeProvider>().eyefunc();
                },
                icon: Icon(
                  context.watch<EyeProvider>().boolean == true
                      ? Icons.remove_red_eye
                      : Icons.remove_red_eye_outlined,
                  color: textColor,
                ),
              ),
              prefixIcon: const Icon(
                Icons.lock_clock_outlined,
                color: Colors.blue,
              ),
              hintStyle: TextStyle(color: textColor),
              hintText: "  Password"),
        ),
      ],
    );
  }
}
