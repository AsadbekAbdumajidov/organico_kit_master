import 'package:flutter/material.dart';
import 'package:organico_kit_master/components/sizeconfig.dart';
import 'package:organico_kit_master/core/sign_const.dart';
import 'package:provider/provider.dart';
import '../../../core/color_const.dart';
import '../../../provider/sign_in_provider.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: he(10)),
          child: ElevatedButton(
            style: OutlinedButton.styleFrom(
              fixedSize: const Size(374, 50),
              backgroundColor: ConstColor.buttomColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
            ),
            onPressed: () {
              context
                  .read<SignInProvider>()
                  .signInFunction(
                      SignInConst.login.text, SignInConst.password.text)
                  .then((value) {
                if (value == true) {
                  return Navigator.pushNamedAndRemoveUntil(
                      context, '/bottomNAvBar', (route) => false);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Email or password is incorrect !"),
                    ),
                  );
                }
              });
            },
            child: const Center(
              child: Text(
                "Sign In",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: "nunito"),
              ),
            ),
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(top: he(20)),
          child: ElevatedButton(
            style: OutlinedButton.styleFrom(
              fixedSize: const Size(374, 50),
              backgroundColor: ConstColor.buttomColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, "/singUp");
            },
            child: const Center(
              child: Text(
                "Sign Up",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: "nunito"),
              ),
            ),
          ),
        ),
      ],
    );
  }
}