import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:organico_kit_master/screens/sign_in/widget/elevated_widget.dart';
import 'package:organico_kit_master/screens/sign_in/widget/forget_pasword_widget.dart';
import 'package:organico_kit_master/screens/sign_in/widget/form_sign_in_widget.dart';
import 'package:organico_kit_master/screens/sign_in/widget/welcome_text_widget.dart';
import '../../components/sizeconfig.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return FadeInUp(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: wi(25)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: he(50)),
                  child: Image.asset("assets/png/Welcome Illustration.png"),
                ),
                const WelcomeTextWidget(),
                const FormSignInWidget(),
                const ForgetPasswordWidget(),
                const ElevatedButtonWidget()
              ],
            ),
          ), 
        ),
      ),
    );
  }
}
