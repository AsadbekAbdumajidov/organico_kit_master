import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:organico_kit_master/components/sizeconfig.dart';
import 'package:organico_kit_master/screens/sign_up/widget/check_box_widget.dart';
import 'package:organico_kit_master/screens/sign_up/widget/elevated_button_widget.dart';
import 'package:organico_kit_master/screens/sign_up/widget/form_sign_up_widget.dart';
import 'package:provider/provider.dart';
import '../../provider/them_provider.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    return FadeInUp(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: wi(20)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: he(60), bottom: he(50)),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.pushNamed(context, "/signIn"),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 25,
                          color: textColor,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: wi(15)),
                        child: Text(
                          "New Registration",
                          style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: "poppins",
                              fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  "It looks like you don’t have an account on this number. Please let us know some information for a secure service.",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                  ),
                ),
                const FormSignUpWidget(),
                Padding(
                  padding: EdgeInsets.only(top: he(15), bottom: he(48)),
                  child: const CheckboxWidget(),
                ),
                const ButtonWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
