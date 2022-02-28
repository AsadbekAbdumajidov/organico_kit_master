import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:organico_kit_master/screens/my_cart/widget/poppey_shop_widget.dart';
import 'package:organico_kit_master/screens/my_cart/widget/streem_builder_cart_widget.dart';
import 'package:provider/provider.dart';
import '../../components/sizeconfig.dart';
import '../../core/color_const.dart';
import '../../provider/them_provider.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    return FadeInUp(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: wi(20)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: he(40)),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/bottomNAvBar");
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: textColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: wi(5)),
                      child: Text(
                        "My cart",
                        style: TextStyle(
                            color: textColor,
                            fontFamily: "poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  const PoppeyWidget(),
                  const StreemBuilderCartWidget(),
                  Padding(
                    padding: EdgeInsets.only(top: he(18)),
                    child: FadeInLeft(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(
                                    color: textColor,
                                    fontFamily: "nunito",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              Text(
                                "\$90",
                                style: TextStyle(
                                    color: textColor,
                                    fontFamily: "poppins",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            style: OutlinedButton.styleFrom(
                              fixedSize: const Size(260, 50),
                              backgroundColor: ConstColor.buttomColor,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                            ),
                            onPressed: () {},
                            child: const Center(
                              child: Text(
                                "Add to bag",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    fontFamily: "nunito"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
