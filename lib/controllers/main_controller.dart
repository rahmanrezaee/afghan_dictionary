import 'dart:collection';
import 'dart:convert';

import 'package:fghan_dicitionary/models/word_model.dart';
import 'package:fghan_dicitionary/services/db_manager.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  //Instace of db Connection
  ConnectionSQLiteService dbService = ConnectionSQLiteService();

  //Keyword Of Search
  RxString keyword = "".obs;

  //List of Word
  RxList<WordModel> dariPashto = RxList<WordModel>();
  RxList<WordModel> dariPashtoDetail = RxList<WordModel>();

  //Loader
  var isLoading = false.obs;
  var isLoadingDetail = false.obs;

  ///Search Word From Database
  Future<void> getResponse() async {
    isLoading(true);
    List<WordModel> tempList = [];

    await dbService.openDatabase();

    //Search From  Tables
    List result = await dbService.getAllWord(this.keyword.value);
    List resultGen = await dbService.getGenWord(this.keyword.value);

    //Convert to Model of Word
    if (result != null) {
      result.forEach((element) {
        tempList.add(WordModel.fromJson(element, "normal"));
      });
    }
    if (resultGen != null) {
      resultGen.forEach((element) {
        tempList.add(WordModel.fromJson(element, "gen"));
      });
    }

    // Remove Duplicate Items
    final Map<String, WordModel> profileMap = new Map();
    tempList.forEach((item) {
      profileMap[item.word!] = item;
    });
    tempList = profileMap.values.toList();

    //Clear Pervise Search And Replace New Search
    dariPashto.clear();
    dariPashto.addAll(tempList);

    isLoading(false);
  }

  ///Search Word From Database for Detail
  Future getWordDetail(WordModel wordModel) async {
    isLoadingDetail(true);
    print("wordModel ${wordModel.toMap()}");
    //Open The Db
    await dbService.openDatabase();
    List<WordModel> result = [];

    // persion Word find English and pashto
    if (wordModel.category == "gen") {
      //Search persion get English
      //Search From  Tables English

      Map resultGen = await dbService.getGenWordById(wordModel.translateId!);
      print("resultGen $resultGen");
      Map? resultWord = await dbService.getWordByName(wordModel.word!);

      String englishMeaning = resultGen['name'];
      if (resultWord != null) {
        englishMeaning = englishMeaning + ", " + resultWord['result'];
      }
      print("englishMeaning $englishMeaning");
      result.add(WordModel.fromJsonToDetail(
          id: resultGen['_id'],
          Lang: "en",
          word: wordModel.word,
          mean: englishMeaning));

      List itemWord = (englishMeaning as String).split(",");
      await Future.wait(itemWord.map((element) async {
        print("element $element");
        //find pashto by english
        Map? resultWordEnl =
            await dbService.getWordByName(element.replaceAll(" ", ""));

        print("resultWord getWordByName $resultWordEnl");

        if (resultWordEnl != null) {
          result.add(WordModel.fromJsonToDetail(
              id: resultWordEnl['_id'],
              Lang: "ps",
              word: wordModel.word,
              mean: resultWordEnl['result']));
        }
      }));

      // result.add(resultWord);
    } else {
      // english or pashto find persion
      Map resultGen =
          await dbService.getWordsById(wordModel.word!, wordModel.id!);

      result.add((WordModel.fromJsonToDetail(
          id: resultGen['_id'],
          Lang: "ps",
          word: wordModel.word,
          mean: resultGen['result'])));

      if (wordModel.word!.contains(RegExp(r'[a-zA-Z]'))) {
        // persion
        String searchWord = getFirstString(wordModel.word!);

        print("searchWord $searchWord");

        Map? resultGenPersion = await dbService.getGenWordByName(searchWord);
        if (resultGenPersion != null)
          result.add((WordModel.fromJsonToDetail(
              id: resultGenPersion['_id'],
              Lang: "fa",
              word: wordModel.word,
              mean: resultGenPersion['name'])));
      } else {
        String searchWord = getFirstString(resultGen['result']);

        print("searchWord s $searchWord ${resultGen['result'].contains(",")}");

        String swm = "";

        if (resultGen['result'].contains(",")) {
          List itemWord = (resultGen['result'] as String).split(",");
          await Future.wait(itemWord.map((element) async {
            print("element $element");
            // Enlgish
            Map? resultGenEnligh =
                await dbService.getGenWordByName(element.replaceAll(" ", ""));

            if (resultGenEnligh != null) swm += resultGenEnligh['name'] + ", ";
          }));
        } else {
          // Enlgish
          Map? resultGenEnligh = await dbService.getGenWordByName(searchWord);

          if (resultGenEnligh != null) swm = resultGenEnligh['name'];
        }

        if (swm.isNotEmpty)
          result.add((WordModel.fromJsonToDetail(
              Lang: "pa", word: wordModel.word, mean: swm)));
      }
      //find pashto by english

    }

    print("result detail $result");
    this.dariPashtoDetail.clear();
    this.dariPashtoDetail.addAll(result);

    isLoadingDetail(false);
  }

  String getFirstString(String s) {
    if (s.contains(",")) {
      return s.split(",")[0];
    } else {
      return s;
    }
  }
}
