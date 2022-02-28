// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:organico_kit_master/components/profile_components.dart';
import 'package:organico_kit_master/provider/edite_provider.dart';
import 'package:organico_kit_master/screens/edit_profile/widget/text_form_widget.dart';
import 'package:provider/provider.dart';
import '../../components/sizeconfig.dart';
import '../../core/color_const.dart';
import '../../provider/google_provider.dart';
import '../../provider/profile_img_provider.dart';
import '../../provider/them_provider.dart';
import '../../services/firebase_detail.dart';

class EditProfilePage extends StatelessWidget {
  var index;
  EditProfilePage({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: he(35), left: wi(15), right: wi(10), bottom: he(10)),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/bottomNAvBar");
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: textColor,
                    ),
                  ),
                  Text(
                    ComponentsProfile.name[index],
                    style: TextStyle(
                        color: textColor, fontFamily: "poppins", fontSize: 22),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: he(170),
              child: Padding(
                padding: EdgeInsets.only(top: he(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            context.read<ProfileImgProvider>().imgTanla();
                          },
                          child: Container(
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
                        ),
                        Positioned(
                          bottom: 2,
                          right: 2,
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: ConstColor.buttomColor,
                            child: const Center(
                              child: Icon(
                                Icons.add_a_photo_outlined,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      text(context),
                      style: TextStyle(color: textColor, fontFamily: "poppins"),
                    )
                  ],
                ),
              ),
            ),
            const TextFormWidget(),
            Padding(
              padding: EdgeInsets.only(top: he(110)),
              child: ElevatedButton(
                style: OutlinedButton.styleFrom(
                  fixedSize: const Size(374, 50),
                  backgroundColor: ConstColor.buttomColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
                onPressed: () {
                  context.read<EditeProvider>().edit();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Data saved !"),
                    ),
                  );
                  Navigator.pushNamed(context, "/bottomNAvBar");
                },
                child: const Center(
                  child: Text(
                    "Save",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: "nunito"),
                  ),
                ),
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

  text(BuildContext context) {
    var email = FireBaseServiceDetail.authUser.currentUser!.email;
    if (email != null) {
      return "Email: $email";
    } else if (email == null) {
      if (context.watch<GoogleProvider>().googleAccount != null) {
        return context
            .watch<GoogleProvider>()
            .googleAccount!
            .displayName
            .toString();
      }
    }
  }
}
