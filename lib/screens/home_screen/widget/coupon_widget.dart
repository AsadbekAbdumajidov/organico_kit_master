import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/sizeconfig.dart';
import '../../../core/color_const.dart';
import '../../../provider/them_provider.dart';

class CouponWidget extends StatelessWidget {
  const CouponWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: he(25),horizontal: wi(20)),
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: he(44),
                  width: wi(44),
                  decoration: BoxDecoration(
                    color: ConstColor.buttomColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Image.asset("assets/png/Ic - Coupon.png"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: wi(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "You have 3 Coupon",
                        style: TextStyle(
                            color: textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: "poppins"),
                      ),
                      Text(
                        "Let’s use this coupon",
                        style: TextStyle(
                            color: textColor,
                            fontSize: 16,
                            fontFamily: "nunito"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: textColor,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
