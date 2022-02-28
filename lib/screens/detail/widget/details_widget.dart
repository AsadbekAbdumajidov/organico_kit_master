import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/sizeconfig.dart';
import '../../../core/color_const.dart';
import '../../../provider/them_provider.dart';
import '../../../services/firebase_detail.dart';

class DetailsWidget extends StatelessWidget {
  final int? index;
  final String? date;
  const DetailsWidget({Key? key, this.index, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Details",
          style: TextStyle(
              color: textColor,
              fontFamily: "poppins",
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        Text(
          "Paprika is a fruit-producing plant that tastes sweet and slightly spicy from the eggplant or Solanaceae tribe. Its green, yellow, red, or purple fru..",
          style: TextStyle(
              color: textColor,
              fontFamily: "nunito",
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.only(top: he(20)),
          child: Row(
            children: [
              Container(
                height: he(50),
                width: wi(50),
                decoration: BoxDecoration(
                  color: ConstColor.buttomColor.withOpacity(0.3),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Icon(Icons.history_outlined,
                          color: ConstColor.blueColor)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: wi(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Time delivery",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: textColor,
                          fontFamily: "poppins",
                          fontSize: 18),
                    ),
                    Text(
                      "25-30 Min",
                      style: TextStyle(
                          color: textColor, fontFamily: "nunito", fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: he(20)),
          child: Row(
            children: [
              Container(
                height: he(50),
                width: wi(50),
                decoration: BoxDecoration(
                  color: ConstColor.buttomColor.withOpacity(0.3),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Icon(Icons.loyalty_outlined,
                          color: ConstColor.blueColor)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: wi(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Category",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: textColor,
                          fontFamily: "poppins",
                          fontSize: 18),
                    ),
                    StreamBuilder(
                      stream: FireBaseServiceDetail.firebaseFirestore
                          .collection(date.toString())
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          var data = snapshot.data!.docs;
                          return Text(
                            data[index!]["category"].toString(),
                            style: TextStyle(
                                color: textColor,
                                fontFamily: "nunito",
                                fontSize: 16),
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
