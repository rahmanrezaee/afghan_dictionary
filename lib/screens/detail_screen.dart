import 'package:fghan_dicitionary/constants.dart';
import 'package:fghan_dicitionary/controllers/main_controller.dart';
import 'package:fghan_dicitionary/models/word_model.dart';
import 'package:fghan_dicitionary/widgets/detail/components/content_word.dart';
import 'package:fghan_dicitionary/widgets/detail/components/header_detail.dart';
import 'package:fghan_dicitionary/widgets/top_area.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  WordModel wordModel;
  DetailScreen(this.wordModel);

  MainController c = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          RightSideTopArea("DetailPage".tr),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  HeaderDetail(wordModel),
                  SizedBox(height: defaultPadding),
                  ContentWord(wordModel)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
