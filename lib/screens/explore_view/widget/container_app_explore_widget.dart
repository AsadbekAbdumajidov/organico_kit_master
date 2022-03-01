import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/sizeconfig.dart';
import '../../../provider/them_provider.dart';

class ContainerAppWidget extends StatelessWidget {
  const ContainerAppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    return Padding(
      padding: EdgeInsets.only(top: he(40)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: wi(10)),
                child: Text(
                  "Explore",
                  style: TextStyle(
                      color: textColor,
                      fontSize: 20,
                      fontFamily: "poppins",
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.sort,
              color: textColor,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
