import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../components/sizeconfig.dart';
import '../../../core/color_const.dart';
import '../../../core/sign_const.dart';
import '../../../provider/google_provider.dart';
import '../../../provider/sign_up_provider.dart';
import '../../../provider/them_provider.dart';
import '../../../services/firebase_detail.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    return Column(
      children: [
        ElevatedButton(
          style: OutlinedButton.styleFrom(
            fixedSize: const Size(374, 50),
            backgroundColor: ConstColor.buttomColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
          ),
          onPressed: () {
            if (SignUpConst.formKey1.currentState!.validate()) {
              context
                  .read<SignUpProvider>()
                  .singUp(SignUpConst.email.text, SignUpConst.pass.text)
                  .then((value) async {
                if (value != null) {
                  context.read<SignUpProvider>().signUpFireStore(
                      FireBaseServiceDetail.authUser.currentUser!.email,
                      SignUpConst.name.text);

                  return Navigator.pushNamedAndRemoveUntil(
                      context, "/bottomNAvBar", (route) => false);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Email yoki pasword shundoq ham bor !"),
                    ),
                  );
                }
              });
            }
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
        Padding(
          padding: EdgeInsets.symmetric(vertical: he(24)),
          child: Text(
            "or Use",
            style: TextStyle(color: textColor),
          ),
        ),
        InkWell(
          onTap: () {
            context.read<GoogleProvider>().signInWithGoogle().then((value) =>
                Navigator.pushNamedAndRemoveUntil(
                    context, '/bottomNAvBar', (route) => false));
          },
          child: Container(
            height: he(50),
            width: 374,
            decoration: BoxDecoration(
                border: Border.all(color: ConstColor.buttomColor),
                borderRadius: const BorderRadius.all(Radius.circular(40))),
            child: Center(
              child: Text(
                "Sign Up With Google",
                style: TextStyle(
                    color: textColor,
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
