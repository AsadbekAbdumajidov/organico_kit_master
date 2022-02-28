import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:organico_kit_master/core/color_const.dart';
import 'package:organico_kit_master/screens/explore_view/explore_view_page.dart';
import 'package:organico_kit_master/screens/home_screen/home_screen_page.dart';
import 'package:organico_kit_master/screens/my_cart/my_cart_page.dart';
import 'package:organico_kit_master/screens/profile/profile_page.dart';
import 'package:provider/provider.dart';

import '../provider/them_provider.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<BottomBar> {
  HomeScreen? _homeScreen;
  ExploreViewPage? _exploreViewPage;
  MyCartPage? _cartPage;
  ProfilePage? _profile;

  final List _pages = [];

  @override
  void initState() {
    super.initState();
    _homeScreen = const HomeScreen();
    _exploreViewPage = const ExploreViewPage();
    _cartPage = const MyCartPage();
    _profile = const ProfilePage();

    _pages.addAll([_homeScreen, _exploreViewPage, _cartPage, _profile]);
    debugPrint("$_pages");
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        onTap: (v) {
          setState(() {
            currentIndex = v;
          });
        },
        selectedItemColor: ConstColor.buttomColor,
        unselectedItemColor: textColor,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: currentIndex == 0
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SvgPicture.asset(
                      "assets/svg/true - Home.svg",
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SvgPicture.asset(
                      "assets/svg/false - Home.svg",
                    ),
                  ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            label: 'Eplore',
            icon: currentIndex == 1
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SvgPicture.asset(
                      "assets/svg/true - Search.svg",
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SvgPicture.asset(
                      "assets/svg/flase- Search.svg",
                    ),
                  ),
          ),
          BottomNavigationBarItem(
            label: 'Cart',
            icon: currentIndex == 2
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SvgPicture.asset(
                      "assets/svg/true - Cart.svg",
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SvgPicture.asset(
                      "assets/svg/false - Cart.svg",
                    ),
                  ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: currentIndex == 3
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SvgPicture.asset(
                      "assets/svg/true - Profile.svg",
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SvgPicture.asset(
                      "assets/svg/false - Profile.svg",
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
