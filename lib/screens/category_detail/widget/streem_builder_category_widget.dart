import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../components/sizeconfig.dart';
import '../../../core/color_const.dart';
import '../../../provider/prise_add_remove_provider.dart';
import '../../../provider/them_provider.dart';
import '../../../services/firebase_detail.dart';

class StreemBuilderForCategoryWidget extends StatelessWidget {
  final int? index1,index2;
  final String? name;
  const StreemBuilderForCategoryWidget({Key? key, this.index1, this.name,this.index2})
      : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    return SizedBox(
      height: he(360),
      width: double.infinity,
      child: StreamBuilder(
        stream: FireBaseServiceDetail.firebaseFirestore
            .collection("Category")
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!.docs;
            return Column(
              children: [
                CachedNetworkImage(
                  imageUrl:data[index1!][name.toString()]["img"][index2], 
                  height: he(170),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: he(20)),
                      child: Text(
                        data[index1!][name.toString()]["name"][index2],
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
                         data[index1!][name.toString()]["shop"][index2],
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
                                      .priceRemove(data[index1!][name.toString()]["price"][index2]);
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
                                      .priceAdd(data[index1!][name.toString()]["price"][index2]);
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
