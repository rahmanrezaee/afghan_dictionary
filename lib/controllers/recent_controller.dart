import 'dart:convert';
import 'dart:developer';

import 'package:fghan_dicitionary/models/word_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecentController extends GetxController {
  RxList<WordModel> items = RxList<WordModel>();

  var isLoading = false.obs;

  Future addToRecent(WordModel item) async {
    items.remove(item);
    updateListSharedPerference();
    items.add(item);
    updateListSharedPerference();
  }

  Future removeToRecent(WordModel item) async {
    items.remove(item);
    updateListSharedPerference();
  }

  Future updateListSharedPerference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("cart");

    String data = json.encode(items.map((e) => e.toMap()).toList());

    print("data $data");

    await prefs.setString('recent', data);
  }

  Future getRecentItems() async {
    isLoading(true);
    log("Start to Load");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('recent') != null) {
      List<WordModel> itemsTemp = [];
      List itemRecent = jsonDecode(prefs.getString('recent')!);
      log("itemRecent  $itemRecent");

      itemRecent.forEach((element) {
        itemsTemp.add(WordModel.fromJsonIn(element));
      });
      items.clear();
      items.addAll(itemsTemp);
    }
    isLoading(false);
  }
}
