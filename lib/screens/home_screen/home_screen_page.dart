import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:organico_kit_master/screens/home_screen/widget/coupon_widget.dart';
import 'package:organico_kit_master/screens/home_screen/widget/location_widget.dart';
import 'package:organico_kit_master/screens/home_screen/widget/search_widget.dart';
import 'package:organico_kit_master/screens/home_screen/widget/streem_builder_best_widget.dart';
import 'package:organico_kit_master/screens/home_screen/widget/streem_builder_category_widget.dart';
import 'package:provider/provider.dart';
import '../../components/sizeconfig.dart';
import '../../provider/them_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    SizeConfig().init(context);
    return FadeInUp(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const LocationWidget(),
            const SearchWidget(),
            const CouponWidget(),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: wi(20), vertical: he(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Choose Category",
                        style: TextStyle(
                            color: textColor,
                            fontSize: 20,fontWeight: FontWeight.bold,
                            fontFamily: "poppins"),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(
                            color: textColor,
                            fontSize: 18,
                            fontFamily: "nunnito"),
                      ),
                    ],
                  ),
                ),
                const StreemBuilderCategoryWidget()
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: he(20)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: wi(20), vertical: he(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Best Selling",
                          style: TextStyle(fontWeight: FontWeight.bold,
                              color: textColor,
                              fontSize: 20,
                              fontFamily: "poppins"),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                              color: textColor,
                              fontSize: 18,
                              fontFamily: "nunnito"),
                        ),
                      ],
                    ),
                  ),
                 const StreemBuilderBestWidget()
                   ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
