import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/sizeconfig.dart';
import '../../../core/color_const.dart';
import '../../../provider/them_provider.dart';

class AddRemoveButtonsWidget extends StatelessWidget {
  const AddRemoveButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: he(35)),
      child: Row(
        children: [
          ElevatedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: Size(wi(5), he(5)),
              backgroundColor: ConstColor.buttomColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onPressed: () {},
            child: const Center(
              child: Icon(
                Icons.remove,
                size: 14,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: wi(15)),
            child: Text(
              "1",
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: "poppins",
                  fontSize: 20),
            ),
          ),
          ElevatedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: Size(wi(5), he(5)),
              backgroundColor: ConstColor.buttomColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onPressed: () {},
            child: const Center(
              child: Icon(
                Icons.add,
                size: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
