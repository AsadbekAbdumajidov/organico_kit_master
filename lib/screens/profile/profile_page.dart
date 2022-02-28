import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organico_kit_master/screens/profile/widget/app_container_profile_widget.dart';
import 'package:organico_kit_master/screens/profile/widget/builder_widget.dart';
import 'package:organico_kit_master/screens/profile/widget/streem_builder_profile.widget.dart';
import 'package:provider/provider.dart';
import '../../components/sizeconfig.dart';
import '../../core/color_const.dart';
import '../../provider/profile_img_provider.dart';
import '../../provider/them_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    SizeConfig().init(context);
    return FadeInUp(
      child: Scaffold(
        body: Column(
          children: [
            const AppContainerProfileWidget(),
            SizedBox(
              height: he(230),
              child: Padding(
                padding: EdgeInsets.only(top: he(10)),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.14,
                      width: MediaQuery.of(context).size.width * 0.32,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: img(context),
                    ),
                    const StreemBuilderProfileWidget(),
                  ],
                ),
              ),
            ),
            FadeInLeft(
              child: Column(
                children: [
                  const BuilderProfileWidget(),
                  ListTile(
                    leading: Container(
                      height: he(50),
                      width: wi(50),
                      decoration: BoxDecoration(
                          color: ConstColor.buttomColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: const Center(
                          child: Icon(Icons.nightlight_outlined,
                              color: Colors.white)),
                    ),
                    title: Text(
                      "Dark Mode",
                      style: TextStyle(color: textColor, fontFamily: "poppins"),
                    ),
                    trailing: CupertinoSwitch(
                      value: context.watch<DarkVsLightProvider>().svichBool,
                      onChanged: (v) {
                        context.read<DarkVsLightProvider>().colorRef();
                      },
                      thumbColor: Colors.white,
                      activeColor: const Color.fromRGBO(12, 114, 100, 1),
                      trackColor: Colors.blueGrey.shade400,
                    ),

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  img(BuildContext context) {
    return context.watch<ProfileImgProvider>().picture.path != ""
        ? Image.file(context.watch<ProfileImgProvider>().picture)
        : Image.asset("assets/image/person.png");
  }
}
