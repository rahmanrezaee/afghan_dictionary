import 'dart:convert';
import 'dart:developer';

import 'package:admin/models/word_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteController extends GetxController {
  RxList<WordModel> items = RxList<WordModel>();

  var isLoading = false.obs;

  Future addToFavorite(WordModel item) async {
    items.add(item);
    updateListSharedPerference();
  }

  Future removeToFavorite(WordModel item) async {
    items.remove(item);
    updateListSharedPerference();
  }

  Future updateListSharedPerference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("cart");

    String data = json.encode(items.map((e) => e.toMap()).toList());

    print("data $data");

    await prefs.setString('favorite', data);
  }

  Future getFavoriteItems() async {
    isLoading(true);
    log("Start to Load");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('favorite') != null) {
      List<WordModel> itemsTemp = [];
      List itemFavorite = jsonDecode(prefs.getString('favorite')!);
      log("itemFavorite  $itemFavorite");

      itemFavorite.forEach((element) {
        itemsTemp.add(WordModel.fromJsonIn(element));
      });
      items.clear();
      items.addAll(itemsTemp);
    }
    isLoading(false);
  }
}
