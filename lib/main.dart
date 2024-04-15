import 'package:find_me/view/main_screen.dart';
import 'package:find_me/view/ProductSearchFolder/searchfakeproducts.dart';
import 'package:find_me/view/scan/barcode_scan_page.dart';
import 'package:find_me/view/scan/render_barcode_page.dart';
import 'package:find_me/view/splash_screen.dart';
import 'package:find_me/view/starting.dart';
import 'package:find_me/core/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //return GetMaterialApp
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, //tna7i il faza il 7amra
      title: 'Find Me',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //  home: SearchFakeProducts(),
      home: const SplashScreen(),
    );
  }
}
