import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../components/profile_components.dart';
import '../../../components/sizeconfig.dart';
import '../../../core/color_const.dart';
import '../../../provider/them_provider.dart';

class BuilderProfileWidget extends StatelessWidget {
  const BuilderProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    return SizedBox(
      height: he(410),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(0),
        itemCount: ComponentsProfile.name.length,
        itemBuilder: (_, __) {
          return Padding(
            padding: EdgeInsets.only(top: he(2)),
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, ComponentsProfile.nav[__],
                    arguments: __);
              },
              leading: Container(
                height: he(50),
                width: wi(50),
                decoration: BoxDecoration(
                    color: ConstColor.buttomColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Center(
                  child: Icon(
                    ComponentsProfile.i[__],
                    color: Colors.white,
                  ),
                ),
              ),
              title: Text(
                ComponentsProfile.name[__],
                style: TextStyle(color: textColor, fontFamily: "poppins"),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded, color: textColor),
            ),
          );
        },
      ),
    );
  }
}
