import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:organico_kit_master/provider/edite_provider.dart';
import 'package:organico_kit_master/provider/notif_provider.dart';
import 'package:organico_kit_master/provider/prise_add_remove_provider.dart';
import 'package:organico_kit_master/provider/profile_img_provider.dart';
import 'package:organico_kit_master/routes/router.dart';
import 'package:provider/provider.dart';
import 'provider/them_provider.dart';
import 'package:organico_kit_master/provider/eye_provider.dart';
import '../provider/check_provider.dart';
import '../provider/google_provider.dart';
import '../provider/sign_in_provider.dart';
import '../provider/sign_up_provider.dart';
import '../provider/them_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => DarkVsLightProvider()),
      ChangeNotifierProvider(create: (_) => EyeProvider()),
      ChangeNotifierProvider(create: (_) => CheckProvider()),
      ChangeNotifierProvider(create: (_) => SignUpProvider()),
      ChangeNotifierProvider(create: (_) => SignInProvider()),
      ChangeNotifierProvider(create: (_) => GoogleProvider()),
      ChangeNotifierProvider(create: (_) => EditeProvider()),
      ChangeNotifierProvider(create: (_) => NotifProvider()),
      ChangeNotifierProvider(create: (_) => ProfileImgProvider()),
      ChangeNotifierProvider(create: (_) => PriceAddRemoveProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final RouteGenerateKit _forRouter = RouteGenerateKit();

  @override
  Widget build(BuildContext context) {
    var themeColor = context.watch<DarkVsLightProvider>().scaffoldColor;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Organico kit master',
        theme: themeColor,
        initialRoute: '/',
        onGenerateRoute: _forRouter.generateKit);
  }
}
