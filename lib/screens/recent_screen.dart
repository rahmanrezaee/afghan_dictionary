import 'package:fghan_dicitionary/constants.dart';
import 'package:fghan_dicitionary/widgets/globle/components/header.dart';
import 'package:fghan_dicitionary/widgets/recent/components/recent_list.dart';
import 'package:fghan_dicitionary/widgets/top_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          RightSideTopArea("RecentPage".tr),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Header("RecentList".tr),
                  SizedBox(height: defaultPadding),
                  RecentList()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
