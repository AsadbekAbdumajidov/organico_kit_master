import 'package:flutter/material.dart';
import 'package:organico_kit_master/components/bottom_nav_bar.dart';
import 'package:organico_kit_master/screens/category/category_page.dart';
import 'package:organico_kit_master/screens/detail/detail_page.dart';
import 'package:organico_kit_master/screens/edit_profile/edit_profile.dart';
import 'package:organico_kit_master/screens/sign_in/sign_in_page.dart';
import 'package:organico_kit_master/screens/sign_up/sign_up_page.dart';
import 'package:organico_kit_master/screens/splash_screen/splesh_screen_page.dart';

class RouteGenerateKit {
  Route? generateKit(RouteSettings settings) {
    final args = settings.arguments;
    final args1 = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const SpleshScreen(),
        );
      case '/signIn':
        return MaterialPageRoute(
          builder: (context) => const SignInPage(),
        );
      case '/singUp':
        return MaterialPageRoute(
          builder: (context) => const SignUpPage(),
        );
      case '/bottomNAvBar':
        return MaterialPageRoute(
          builder: (context) => const BottomBar(),
        );
      case '/detail':
        return MaterialPageRoute(builder: (context) => const DetailPage());
      case '/cat':
        return MaterialPageRoute(
            builder: (context) => CategoryPage(index: args));
            case '/edit':
        return MaterialPageRoute(
          builder: (context) =>  EditProfilePage(index: args1),
        );
    }
    return null;
  }
}
