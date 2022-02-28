import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:organico_kit_master/components/sizeconfig.dart';
import 'package:provider/provider.dart';
import '../../provider/them_provider.dart';

class SpleshScreen extends StatelessWidget {
  const SpleshScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var textColor = context.watch<DarkVsLightProvider>().textColor;

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(context, '/signIn', (route) => false);
    });

    return FadeInUp(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: he(143),
              width: wi(143),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/png/Logo.png"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: he(24)),
              child: Center(
                child: Text(
                  "Organico",
                  style: TextStyle(
                      color: textColor,fontWeight: FontWeight.bold,
                      fontSize: 24,fontFamily: "poppins"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
