import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common/sqlite_api.dart';

import 'package:path_provider/path_provider.dart';

class ConnectionSQLiteService {
  Database? db;
  Future openDatabase() async {
    sqfliteFfiInit();

    var databaseFactory = databaseFactoryFfi;

    File file = await _localFile;

    if (!await file.exists()) {
      writeDatabase();
    }
    db = await databaseFactory.openDatabase(file.path);
  }

  Future getAllWord(String keyword) async {
    print("word $keyword");
    var result = await db!.query(
        keyword.contains(RegExp(r'[a-zA-Z]')) ? "tbl_eng_pa" : "tbl_pa_eng",
        where: 'word like ?',
        // Pass the Dog's id as a whereArg to prevent SQL injection.
        whereArgs: ["$keyword%"],
        limit: 100);

    return result.isNotEmpty ? result : [];
  }

  Future getWordsById(String keyword, int id) async {
    var result = await db!.query(
        keyword.contains(RegExp(r'[a-zA-Z]')) ? "tbl_eng_pa" : "tbl_pa_eng",
        where: '_id = ?',
        whereArgs: ["$id"],
        limit: 1);

    print("result getWordsById ${result.isNotEmpty ? result.first : null}");
    return result.isNotEmpty ? result.first : null;
  }

  Future getWordByName(String keyword) async {
    print(
        "word $keyword ${keyword.contains(RegExp(r'[a-zA-Z]')) ? "tbl_eng_pa" : "tbl_pa_eng"}");
    var result = await db!.query(
        keyword.contains(RegExp(r'[a-zA-Z]')) ? "tbl_eng_pa" : "tbl_pa_eng",
        where: 'word = ?',
        // Pass the Dog's id as a whereArg to prevent SQL injection.
        whereArgs: ["$keyword"],
        limit: 1);

    print("getWordByName $result");

    return result.isNotEmpty ? result.first : null;
  }

  Future getGenWord(String keyword) async {
    if (keyword.contains(RegExp(r'[a-zA-Z]'))) {
      return [];
    }
    var result = await db!.rawQuery(
        "SELECT * from tbl_fa_eng_words join tbl_fa_eng_translation on tbl_fa_eng_translation.idWord = tbl_fa_eng_words._id  where name like ? COLLATE NOCASE LIMIT 100; ",
        ['$keyword%']);

    return result.isNotEmpty ? result : [];
  }

  Future getGenWordByName(String keyword) async {
    var result = await db!.rawQuery(
        "SELECT * from tbl_fa_eng_words join tbl_fa_eng_translation on tbl_fa_eng_translation.idWord = tbl_fa_eng_words._id  where name = ? COLLATE NOCASE;",
        ['$keyword']);
    print("result gen word $keyword $result");

    return result.isNotEmpty
        ? getGenWordById(result[0]['idTranslation'] as int)
        : null;
  }

  Future getGenWordById(int id) async {
    print("gen search $id");
    List result = await db!.rawQuery(
        "SELECT * from tbl_fa_eng_words where _id = ? COLLATE NOCASE;",
        ['$id']);

    print("result $result");

    return result.isNotEmpty ? result.first : null;
  }

  Future<String> get _localPath async {
    final directory = await getApplicationSupportDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;

    print("path $path/database.db");
    return File('$path/database.db');
  }

  Future<File> writeDatabase() async {
    final file = await _localFile;
    ByteData data = await rootBundle.load("assets/db/database.db");
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    // Write the file

    return file.writeAsBytes(bytes);
  }

  Future closeDb() async {
    if (db != null) db!.close();
  }
}
