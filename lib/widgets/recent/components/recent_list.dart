import 'package:admin/controllers/recent_controller.dart';
import 'package:admin/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentList extends StatefulWidget {
  @override
  State<RecentList> createState() => _RecentListState();
}

class _RecentListState extends State<RecentList> {
  RecentController controller = Get.find<RecentController>();

  @override
  void initState() {
    if (controller.items.isEmpty) controller.getRecentItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        if (controller.isLoading.value)
          return Center(child: CircularProgressIndicator());
        else
          return controller.items.isNotEmpty
              ? ListView.builder(
                  itemCount: controller.items.length > 100
                      ? 100
                      : controller.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: (index % 2 == 0)
                          ? null
                          : Theme.of(context).highlightColor,
                      child: ListTile(
                        onTap: () {
                          Get.to(() => DetailScreen(controller
                              .items[controller.items.length - index - 1]));
                        },
                        title: Text(
                            "${controller.items[controller.items.length - index - 1].word}"),
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
