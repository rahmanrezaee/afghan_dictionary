import 'package:admin/constants.dart';
import 'package:admin/controllers/favorite_controller.dart';
import 'package:admin/widgets/favorite/components/favorite_list.dart';
import 'package:admin/widgets/globle/components/header.dart';
import 'package:admin/widgets/top_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          RightSideTopArea("FavoritePage".tr),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Header("FavoriteList".tr),
                  SizedBox(height: defaultPadding),
                  FavoriteList()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
