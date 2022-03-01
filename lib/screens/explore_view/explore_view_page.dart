import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/sizeconfig.dart';
import '../../core/category_color_const.dart';
import '../../core/color_const.dart';
import '../../provider/them_provider.dart';
import '../../services/firebase_detail.dart';
import 'widget/container_app_explore_widget.dart';

class ExploreViewPage extends StatelessWidget {
  const ExploreViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    SizeConfig().init(context);
    return Scaffold(
      body: StreamBuilder(
          stream: FireBaseServiceDetail.firebaseFirestore
              .collection("Explore")
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data!.docs;

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: he(20)),
                child: Column(
                  children: [
                    const ContainerAppWidget(),
                    SizedBox(
                      height: he(708),
                      child: GridView.builder(
                        padding: EdgeInsets.only(top: he(10)),
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        cacheExtent: he(300),
                        itemCount: data.length,
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
                              color: ConstCategoryColor.exploreColor[__],
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: he(10), left: wi(15), right: wi(15)),
                              child: InkWell(
                                onTap: () {},
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: CachedNetworkImage(
                                        imageUrl: data[__]["img"],
                                        height: he(80),
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
}
