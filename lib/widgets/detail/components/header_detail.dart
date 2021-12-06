import 'dart:io';

import 'package:admin/controllers/favorite_controller.dart';
import 'package:admin/controllers/main_controller.dart';
import 'package:admin/models/word_model.dart';
import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';

class HeaderDetail extends StatefulWidget {
  WordModel title;
  HeaderDetail(this.title);

  @override
  State<HeaderDetail> createState() => _HeaderDetailState();
}

class _HeaderDetailState extends State<HeaderDetail> {
  FavoriteController favoriteController = Get.find<FavoriteController>();
  MainController controller = Get.find<MainController>();

  @override
  void initState() {
    if (favoriteController.items.isEmpty) favoriteController.getFavoriteItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back)),
              
          Expanded(
            child: Text(
              "ResultSearch".tr + " \'${widget.title.word}\' ",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Obx(() {
            print(
                "favorite ${favoriteController.items.contains(widget.title)}");
            if (favoriteController.isLoading.value)
              return Center(child: CircularProgressIndicator());
            else
              return IconButton(
                  onPressed: () {
                    if (!favoriteController.items.contains(widget.title)) {
                      print("add to favorite");
                      favoriteController.addToFavorite(widget.title);
                    } else {
                      print("remove to favorite");
                      favoriteController.removeToFavorite(widget.title);
                    }
                  },
                  icon: Icon(favoriteController.items.contains(widget.title)
                      ? Icons.favorite
                      : Icons.favorite_border));
          }),
        ],
      ),
    );
  }
}
