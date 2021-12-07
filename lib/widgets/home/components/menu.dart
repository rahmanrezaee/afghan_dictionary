import 'package:fghan_dicitionary/widgets/home/components/modal_change_lang.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuFloat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: CircularMenu(alignment: Alignment.bottomCenter, items: [
        CircularMenuItem(
            icon: Icons.brightness_2_outlined,
            onTap: () {
              Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark());

              SharedPreferences.getInstance().then((value) {
                SharedPreferences prefs = value;
                Get.isDarkMode
                    ? prefs.setInt('isDark', 0)
                    : prefs.setInt('isDark', 1);
              });
              // callback
            }),
        CircularMenuItem(
            icon: Icons.translate_rounded,
            onTap: () {
              showModalBottomSheet(
                // expand: false,
                isScrollControlled: true,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => ModalChangeLang(),
              );
            }),
        CircularMenuItem(
            icon: Icons.forward_5_outlined,
            onTap: () {
              Get.toNamed("/recent");
            }),
        CircularMenuItem(
            icon: Icons.favorite,
            onTap: () {
              Get.toNamed("/favorite");
              //callback
            }),
        CircularMenuItem(
            icon: Icons.info_outline,
            onTap: () {
              //callback
              Get.toNamed("/about-us");
            }),
      ]),
    );
  }
}
