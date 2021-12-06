import 'package:admin/constants.dart';
import 'package:admin/controllers/main_controller.dart';
import 'package:admin/widgets/home/components/search_field.dart';
import 'package:admin/widgets/home/components/list_word.dart';
import 'package:admin/widgets/home/components/menu.dart';
import 'package:admin/widgets/top_area.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainController c = Get.find<MainController>();
  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((value) {
      SharedPreferences prefs = value;
      if (prefs.getInt('isDark') != 1) Get.changeTheme(ThemeData.light());

      if (prefs.getString("lang") != null)
        Get.updateLocale(Locale(prefs.getString("lang")!));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MenuFloat(),
      body: Column(
        children: [
          RightSideTopArea("HomePage".tr),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SearchField(),
                  SizedBox(height: defaultPadding),
                  ListWord()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
