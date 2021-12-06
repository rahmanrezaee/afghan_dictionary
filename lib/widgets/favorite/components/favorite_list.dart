import 'package:admin/controllers/favorite_controller.dart';
import 'package:admin/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteList extends StatefulWidget {
  @override
  State<FavoriteList> createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  FavoriteController controller = Get.find<FavoriteController>();

  @override
  void initState() {
    if (controller.items.isEmpty) controller.getFavoriteItems();
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
                          Get.to(() => DetailScreen(controller.items[index]));
                        },
                        title: Text("${controller.items[index].word}"),
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
