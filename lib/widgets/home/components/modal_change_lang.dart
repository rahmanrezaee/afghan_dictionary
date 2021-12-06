import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../top_area.dart';

class ModalChangeLang extends StatefulWidget {
  final bool reverse;

  ModalChangeLang({Key? key, this.reverse = false}) : super(key: key);

  @override
  State<ModalChangeLang> createState() => _ModalChangeLangState();
}

class _ModalChangeLangState extends State<ModalChangeLang> {
  @override
  Widget build(BuildContext context) {
    print("lanage ${Get.locale}");
    return Wrap(
      children: [
        Container(
          // color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: new BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(15.0),
                topRight: const Radius.circular(15.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 47,
                    height: 3,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "SelectLanguage".tr,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                _langButtonBuilder("English", Get.locale.toString() == "en",
                    () {
                  Get.updateLocale(Locale("en"));

                  Get.back();
                }),
                SizedBox(height: 12),
                _langButtonBuilder("دری", Get.locale.toString() == "fa", () {
                  Get.updateLocale(Locale("fa"));
                  Get.back();
                }),
                SizedBox(height: 12),
                _langButtonBuilder("پشتو", Get.locale.toString() == "ps", () {
                  Get.updateLocale(Locale("ps"));
                  Get.back();
                }),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Padding _langButtonBuilder(String text, bool selected, Function onClick) {
    print("selected $selected");
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary:
                selected == true ? null : Theme.of(context).backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
          child: Container(
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          onPressed: () {
            onClick();
            SharedPreferences.getInstance().then((value) {
              SharedPreferences prefs = value;
              prefs.setString('lang', Get.locale.toString());
            });
            Get.back();
          }),
    );
  }
}
