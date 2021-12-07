import 'package:fghan_dicitionary/constants.dart';
import 'package:fghan_dicitionary/widgets/about_us/components/aboutUs_content.dart';
import 'package:fghan_dicitionary/widgets/globle/components/header.dart';
import 'package:fghan_dicitionary/widgets/top_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          RightSideTopArea("Aboutus".tr),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Header("Aboutus".tr),
                    SizedBox(height: defaultPadding),
                    AboutUsContent()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
