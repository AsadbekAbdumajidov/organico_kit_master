import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:organico_kit_master/components/sizeconfig.dart';
import 'package:organico_kit_master/provider/cart_add_provider.dart';
import 'package:organico_kit_master/screens/detail/widget/details_widget.dart';
import 'package:organico_kit_master/screens/detail/widget/streem_builder_widget.dart';
import 'package:provider/provider.dart';
import '../../core/color_const.dart';
import '../../provider/them_provider.dart';
import '../../services/firebase_detail.dart';

class DetailPage extends StatelessWidget {
  final int? index;
  final String? date, name;
  const DetailPage({Key? key, this.index, this.date, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    return FadeInUp(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: wi(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: he(40)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios, color: textColor),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border, color: textColor),
                    ),
                  ],
                ),
              ),
              StreemBuilderDetailWidget(date: date, index: index),
              DetailsWidget(date: date, index: index),
              Padding(
                padding: EdgeInsets.only(top: he(40)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StreamBuilder(
                        stream: FireBaseServiceDetail.firebaseFirestore
                            .collection(date!)
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData) {
                            var data = snapshot.data!.docs;
                            return ElevatedButton(
                              style: OutlinedButton.styleFrom(
                                fixedSize: const Size(280, 50),
                                backgroundColor: ConstColor.buttomColor,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, "/bottomNAvBar");
                                context.read<CartProvider>().cartAddData(
                                      data[index!],
                                    );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Saved to the cart"),
                                  ),
                                );
                              },
                              child: const Center(
                                child: Text(
                                  "Add to cart",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      fontFamily: "nunito"),
                                ),
                              ),
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        }),
                    ElevatedButton(
                      style: OutlinedButton.styleFrom(
                        fixedSize: const Size(5, 55),
                        backgroundColor: ConstColor.greeyColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                      onPressed: () {},
                      child: Center(
                          child: Icon(
                        Icons.chat_outlined,
                        color: textColor,
                        size: 20,
                      )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
