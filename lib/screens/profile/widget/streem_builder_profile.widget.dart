import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/sizeconfig.dart';
import '../../../core/sign_const.dart';
import '../../../provider/them_provider.dart';
import '../../../services/firebase_detail.dart';

class StreemBuilderProfileWidget extends StatelessWidget {
  const StreemBuilderProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    return StreamBuilder(
      stream: FireBaseServiceDetail.firebaseFirestore
          .collection("Users")
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: EdgeInsets.only(top: he(15)),
              child: Column(
                children: [
                  Text(
                   EditConst.name.text.isEmpty ?   "Name: John":"Name: ${EditConst.name.text}",
                    style: TextStyle(
                        color: textColor, fontFamily: "poppins", fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Phone: (+998) ",
                        style: TextStyle(
                            color: textColor,
                            fontFamily: "poppins",
                            fontSize: 16),
                      ),
                      Text(
                        EditConst.phone.text.isEmpty? "90 777 77 77 " : EditConst.phone.text,
                        style: TextStyle(
                            color: textColor,
                            fontSize: 16),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  
}
