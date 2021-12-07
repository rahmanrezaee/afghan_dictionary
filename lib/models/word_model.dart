import 'package:fghan_dicitionary/constants.dart';
import 'package:flutter/material.dart';

class WordModel {
  WordModel({this.id, this.word, this.category});
  WordModel.fromJsonToDetail({this.id, this.word, this.Lang, this.mean});

  int? id;
  String? word;
  String? category;
  int? translateId;
  String? Lang;
  String? mean;

  WordModel.fromJson(Map<String, dynamic> json, category) {
    this.id = json['_id'];
    this.category = category;
    if (category == "gen") {
      this.word = json['name'];
      this.translateId = json['idTranslation'];
    } else {
      this.word = json['word'];
    }
  }
  WordModel.fromJsonIn(Map<String, dynamic> json) {
    this.id = json['id'];
    this.category = json['category'];
    this.word = json['word'];
    this.translateId = json['translateId'];
  }

  Map toMap() {
    return {
      "id": this.id,
      "category": this.category,
      "word": this.word,
      "translateId": this.translateId
    };
  }
}
