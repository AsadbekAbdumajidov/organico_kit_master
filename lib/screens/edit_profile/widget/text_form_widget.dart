import 'package:flutter/material.dart';
import 'package:organico_kit_master/core/sign_const.dart';
import 'package:provider/provider.dart';

import '../../../components/sizeconfig.dart';
import '../../../provider/them_provider.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: he(20)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: he(25)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: he(10)),
                  child: Text(
                    "Name",
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: "nunito",
                        fontSize: 18),
                  ),
                ),
                Container(
                  height: he(48),
                  decoration: BoxDecoration(
                      border: Border.all(color: textColor, width: 0.5),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: wi(15)),
                      child: TextFormField(
                        controller: EditConst.name,
                        decoration: const InputDecoration.collapsed(
                            hintText: "  Full Name"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: he(10), top: he(15)),
                child: Text(
                  "Phone",
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: "nunito",
                      fontSize: 18),
                ),
              ),
              Container(
                height: he(48),
                decoration: BoxDecoration(
                    border: Border.all(color: textColor, width: 0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: wi(15)),
                    child: TextFormField(
                      controller: EditConst.phone,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration.collapsed(
                          hintText: "  Phone number"),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: he(10), top: he(15)),
                child: Text(
                  "Address",
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: "nunito",
                      fontSize: 18),
                ),
              ),
              Container(
                height: he(127),
                width: wi(374),
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: textColor),
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: EditConst.adress,
                    maxLines: 6,
                    decoration: const InputDecoration.collapsed(hintText: ""),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
