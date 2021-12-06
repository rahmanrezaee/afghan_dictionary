import 'package:admin/constants.dart';
import 'package:admin/widgets/globle/components/header.dart';
import 'package:admin/widgets/recent/components/recent_list.dart';
import 'package:admin/widgets/top_area.dart';
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
