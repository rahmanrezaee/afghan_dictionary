import 'package:fghan_dicitionary/controllers/main_controller.dart';
import 'package:fghan_dicitionary/controllers/recent_controller.dart';
import 'package:fghan_dicitionary/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ListWord extends StatefulWidget {
  @override
  State<ListWord> createState() => _ListWordState();
}

class _ListWordState extends State<ListWord> {
  final MainController controller = Get.find<MainController>();

  final RecentController recentController = Get.find<RecentController>();

  @override
  void initState() {
    if (recentController.items.isEmpty) recentController.getRecentItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        if (controller.isLoading.value)
          return Center(child: CircularProgressIndicator());
        else
          return controller.dariPashto.isNotEmpty
              ? ListView.builder(
                  itemCount: controller.dariPashto.length > 100
                      ? 100
                      : controller.dariPashto.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: (index % 2 == 0)
                          ? null
                          : Theme.of(context).highlightColor,
                      child: ListTile(
                        onTap: () async {
                          await recentController
                              .addToRecent(controller.dariPashto[index]);
                          Get.to(
                              () => DetailScreen(controller.dariPashto[index]));
                        },
                        title: Text("${controller.dariPashto[index].word}"),
                      ),
                    );
                  },
                )
              : Center(
                  child: Image.asset(
                    "assets/images/loupe.png",
                    width: 150,
                  ),
                );
      }),
    );
  }
}
