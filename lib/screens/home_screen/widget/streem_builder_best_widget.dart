import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:organico_kit_master/screens/detail/detail_page.dart';
import 'package:provider/provider.dart';

import '../../../components/sizeconfig.dart';
import '../../../core/category_color_const.dart';
import '../../../core/color_const.dart';
import '../../../provider/them_provider.dart';
import '../../../services/firebase_detail.dart';

class StreemBuilderBestWidget extends StatelessWidget {
  const StreemBuilderBestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    return SizedBox(
      height: he(250),
      width: double.infinity,
      child: StreamBuilder(
        stream: FireBaseServiceDetail.firebaseFirestore
            .collection('Best')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!.docs;
            String date = "Best";
            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.docs.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, __) {
                  return SlideInLeft(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          vertical: he(10), horizontal: wi(15)),
                      height: he(242),
                      width: wi(190),
                      decoration: BoxDecoration(
                        
                        color: ConstCategoryColor.bestSellingColor[__],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: he(10), left: wi(15), right: wi(15)),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    DetailPage(date: date, index: __),
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CachedNetworkImage(
                                  imageUrl: data[__]["img"],
                                  height: he(90),
                                ),
                              ),
                              Text(
                                data[__]["name"],
                                maxLines: 1,
                                style: TextStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "poppins",
                                    fontSize: 18),
                              ),
                              Text(
                                data[__]["shop"],
                                maxLines: 1,
                                style: TextStyle(
                                    color: textColor,
                                    fontFamily: "nunito",
                                    fontSize: 18),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: he(5)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$${data[__]["price"]}/KG",
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: textColor,
                                          fontFamily: "poppins",
                                          fontSize: 17),
                                    ),
                                    ElevatedButton(
                                      style: OutlinedButton.styleFrom(
                                        minimumSize: Size(wi(10), he(44)),
                                        backgroundColor: ConstColor.buttomColor,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const Icon(
                                        Icons.add,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
