import 'package:fghan_dicitionary/controllers/main_controller.dart';
import 'package:fghan_dicitionary/models/word_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class ContentWord extends StatefulWidget {
  WordModel wordModel;

  ContentWord(this.wordModel);

  @override
  State<ContentWord> createState() => _ContentWordState();
}

class _ContentWordState extends State<ContentWord> {
  final MainController controller = Get.find<MainController>();

  @override
  void initState() {
    super.initState();

    controller.getWordDetail(widget.wordModel);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Obx(() {
        if (controller.isLoadingDetail.value)
          return Center(child: CircularProgressIndicator());
        else
          return controller.dariPashtoDetail.isNotEmpty
              ? ListView.builder(
                  itemCount: controller.dariPashtoDetail.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ListTile(
                          subtitle: Text(
                              "${controller.dariPashtoDetail[index].Lang}"),
                          title: Text(
                              "${controller.dariPashtoDetail[index].mean}"),
                        ),
                        controller.dariPashtoDetail.length - 1 == index
                            ? SizedBox()
                            : Divider(),
                      ],
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
