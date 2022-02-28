// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:organico_kit_master/core/category_color_const.dart';
import 'package:organico_kit_master/screens/category/widget/app_container_widget.dart';
import 'package:provider/provider.dart';

import '../../components/sizeconfig.dart';
import '../../core/color_const.dart';
import '../../provider/from_cate_to_the_cart.dart';
import '../../provider/them_provider.dart';
import '../../services/firebase_detail.dart';
import '../category_detail/category_detail.dart';

class CategoryPage extends StatelessWidget {
  var index;
  CategoryPage({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    SizeConfig().init(context);
    String name = nameaniqla();
    int lenght = 0;
    return Scaffold(
      body: StreamBuilder(
          stream: FireBaseServiceDetail.firebaseFirestore
              .collection("Category")
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data!.docs;
              for (var item in data[index][name]["name"]) {
                lenght++;
              }
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: he(20)),
                child: Column(
                  children: [
                    AppContainerWidget(name: name),
                    SizedBox(
                      height: he(762),
                      child: GridView.builder(
                        padding: EdgeInsets.only(top: he(10)),
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        cacheExtent: he(300),
                        itemCount: lenght,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: he(234),
                        ),
                        itemBuilder: (_, __) {
                          return Container(
                            margin: const EdgeInsets.all(10),
                            height: he(230),
                            width: wi(178),
                            decoration: BoxDecoration(
                              color: ConstCategoryColor.cartColor[__],
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
                                      builder: (_) => CategoryDetailPage(
                                          name: name,
                                          index1: index,
                                          index2: __),
                                    ),
                                  );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: CachedNetworkImage(
                                        imageUrl: data[index!][name]["img"][__],
                                        height: he(80),
                                      ),
                                    ),
                                    Text(
                                      data[index!][name]["name"][__],
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: textColor,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "poppins",
                                          fontSize: 18),
                                    ),
                                    Text(
                                      data[index!][name]["shop"][__],
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
                                            "\$${data[index!][name]["price"][__]}/KG",
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: textColor,
                                                fontFamily: "poppins",
                                                fontSize: 20),
                                          ),
                                          ElevatedButton(
                                            style: OutlinedButton.styleFrom(
                                              minimumSize: Size(wi(10), he(44)),
                                              backgroundColor:
                                                  ConstColor.buttomColor,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                              ),
                                            ),
                                            onPressed: () {
                                              
                                              String nomi = data[index!][name]
                                                  ["name"][__];
                                                  print(nomi);
                                              String img =
                                                  data[index!][name]["img"][__];
                                                  print(img);
                                              String shop = data[index!][name]
                                                  ["shop"][__];
                                                  print(shop);
                                              String price = data[index!][name]
                                                  ["price"][__].toString();
                                              print(price);
                                              context
                                                  .read<
                                                      FromCateToTheCartProvider>()
                                                  .categCartAddData(
                                                      nomi, img, shop, price);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content:
                                                      Text("Saved to the cart"),
                                                ),
                                              );
                                            },
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
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  nameaniqla() {
    if (index == 0) {
      return "Fruits";
    } else if (index == 1) {
      return "Meat";
    } else if (index == 2) {
      return "Vega";
    }
  }
}
