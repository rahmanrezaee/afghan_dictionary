import 'dart:io';

import 'package:fghan_dicitionary/constants.dart';
import 'package:fghan_dicitionary/controllers/favorite_controller.dart';
import 'package:fghan_dicitionary/controllers/main_controller.dart';
import 'package:fghan_dicitionary/controllers/recent_controller.dart';
import 'package:fghan_dicitionary/screens/about_us_screen.dart';
import 'package:fghan_dicitionary/screens/favorite_screen.dart';
import 'package:fghan_dicitionary/screens/main_screen.dart';
import 'package:fghan_dicitionary/screens/recent_screen.dart';
import 'package:fghan_dicitionary/translations/LocaleString.dart';
import 'package:fghan_dicitionary/widgets/top_area.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // InitialBinding().dependencies();
  runApp(MyApp());
  doWhenWindowReady(() {
    final win = appWindow;
    final initialSize = Size(600, 600);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Custom window with Flutter";
    win.show();
  });
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return AppColors(
        colors: appSkin,
        child: GetMaterialApp(
          locale: Locale("en"),
          smartManagement: SmartManagement.onlyBuilder,
          initialBinding: InitialBinding(),
          debugShowCheckedModeBanner: false,
          translations: LocaleString(),
          title: 'Afghan Dicitionary',
          theme: ThemeData.dark(),
          getPages: [
            GetPage(
              name: '/',
              page: () => MainScreen(),
            ),
            GetPage(
              name: '/favorite',
              page: () => FavoriteScreen(),
            ),
            GetPage(
              name: '/recent',
              page: () => RecentScreen(),
            ),
            GetPage(
              name: '/about-us',
              page: () => AboutUsScreen(),
            ),
          ],
          initialRoute: "/",
        ));
  }
}

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    print('printing from bindings');
    Get.lazyPut(
      () => FavoriteController(),
    );
    Get.lazyPut(
      () => MainController(),
    );
    Get.lazyPut(
      () => RecentController(),
    );
  }
}
