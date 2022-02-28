import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/sizeconfig.dart';
import '../../../core/category_color_const.dart';
import '../../../provider/cart_add_provider.dart';
import '../../../provider/them_provider.dart';
import '../../../services/firebase_detail.dart';
import 'add_remove_buttons_widget.dart';

class StreemBuilderCartWidget extends StatelessWidget {
  const StreemBuilderCartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    return StreamBuilder(
      stream: FireBaseServiceDetail.firebaseFirestore
          .collection("Cart")
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!.docs;
          return Container(
              height: he(560),
              decoration: BoxDecoration(
                  border: Border.all(color: textColor, width: 0.2),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (_, __) {
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: FadeInUp(
                      child: Dismissible(
                        background: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: he(80),
                              width: wi(80),
                              decoration: BoxDecoration(
                                  color: ConstCategoryColor.cartColor[__],
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.delete_outline_sharp,
                                    size: 30,
                                    color: textColor,
                                  ),
                                  Text(
                                    "Take down",
                                    style: TextStyle(color: textColor),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        key: UniqueKey(),
                        onDismissed: (DismissDirection v) {
                          String name = data[__]["name"];
                          context.read<CartProvider>().cartRemoveData(name);
                        },
                        child: Container(
                          height: he(114),
                          width: wi(342),
                          decoration: BoxDecoration(
                            color: ConstCategoryColor.cartColor[__],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: wi(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: data[__]["img"],
                                  height: he(60),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data[__]["name"],
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
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "nunito",
                                          fontSize: 12),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: he(5)),
                                      child: Text(
                                        "\$${data[__]["price"]}/KG",
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: textColor,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "poppins",
                                            fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                                const AddRemoveButtonsWidget()
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
