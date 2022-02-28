import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../components/sizeconfig.dart';
import '../../../core/color_const.dart';
import '../../../provider/prise_add_remove_provider.dart';
import '../../../provider/them_provider.dart';
import '../../../services/firebase_detail.dart';

class StreemBuilderDetailWidget extends StatelessWidget {
  final int? index;
  final String? date;
  const StreemBuilderDetailWidget({Key? key, this.index, this.date})
      : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    return SizedBox(
      height: he(360),
      width: double.infinity,
      child: StreamBuilder(
        stream: FireBaseServiceDetail.firebaseFirestore
            .collection(date!)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!.docs;
            return Column(
              children: [
                CachedNetworkImage(
                  imageUrl: data[index!]["img"],
                  height: he(170),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: he(20)),
                      child: Text(
                        data[index!]["name"],
                        style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: "poppins",
                            fontSize: 24),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data[index!]["shop"],
                          maxLines: 1,
                          style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: "nunito",
                              fontSize: 18),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              style: OutlinedButton.styleFrom(
                                minimumSize: Size(wi(10), he(50)),
                                backgroundColor: ConstColor.buttomColor,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              onPressed: () {
                                if (context
                                        .read<PriceAddRemoveProvider>()
                                        .sanoq !=
                                    1) {
                                  context
                                      .read<PriceAddRemoveProvider>()
                                      .priceRemove(data[index!]["price"]);
                                }
                              },
                              child: const Center(
                                child: Icon(
                                  Icons.remove,
                                  size: 20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: wi(15)),
                              child: Text(
                                context
                                    .watch<PriceAddRemoveProvider>()
                                    .sanoq
                                    .toString(),
                                style: TextStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "poppins",
                                    fontSize: 20),
                              ),
                            ),
                            ElevatedButton(
                              style: OutlinedButton.styleFrom(
                                minimumSize: Size(wi(10), he(50)),
                                backgroundColor: ConstColor.buttomColor,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              onPressed: () {
                                if (context
                                        .read<PriceAddRemoveProvider>()
                                        .sanoq !=
                                    10) {
                                  context
                                      .read<PriceAddRemoveProvider>()
                                      .priceAdd(data[index!]["price"]);
                                }
                              },
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: he(10)),
                      child: Text(
                        "\$${context.watch<PriceAddRemoveProvider>().jamiPrice}/KG",
                        maxLines: 1,
                        style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: "poppins",
                            fontSize: 24),
                      ),
                    ),
                  ],
                )
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
