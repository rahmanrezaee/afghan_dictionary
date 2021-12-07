import 'dart:io';

import 'package:fghan_dicitionary/controllers/main_controller.dart';
import 'package:fghan_dicitionary/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class SearchField extends GetView<MainController> {
  TextEditingController controllerText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      // textDirection: controllerText.text.contains(RegExp(r'[a-zA-Z]'))
      //     ? TextDirection.ltr
      //     : TextDirection.rtl,
      controller: controllerText,
      onChanged: (value) {
        controller.keyword.value = value;
        controller.getResponse();
      },
      autofocus: true,
      decoration: InputDecoration(
        hintText: "SearchPlaceholder".tr,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () async {
            controller.keyword.value = "";
            controller.dariPashto.clear();
            controllerText.text = "";
          },
          child: Icon(Icons.close),
        ),
      ),
    );
  }
}
