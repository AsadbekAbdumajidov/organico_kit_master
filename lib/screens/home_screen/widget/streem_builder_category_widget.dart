import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../components/sizeconfig.dart';
import '../../../core/category_color_const.dart';
import '../../../provider/them_provider.dart';
import '../../../services/firebase_detail.dart';

class StreemBuilderCategoryWidget extends StatelessWidget {
  final String? name;
  final int? index;
  const StreemBuilderCategoryWidget({Key? key, this.index, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    return SizedBox(
      height: he(160),
      width: double.infinity,
      child: StreamBuilder(
        stream: FireBaseServiceDetail.firebaseFirestore
            .collection('Category')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!.docs;

            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.docs.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, __) {
                  return SlideInLeft(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          vertical: he(10), horizontal: wi(15)),
                      height: he(134),
                      width: wi(130),
                      decoration: BoxDecoration(
                        color: ConstCategoryColor.categoryConst[__],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: he(10), horizontal: wi(15)),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/cat", arguments: __);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CachedNetworkImage(
                                imageUrl: data[__]["img"],
                                height: he(55),
                              ),
                              Text(
                                data[__]["name"],
                                maxLines: 1,
                                style: TextStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "poppins",
                                    fontSize: 18),
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
