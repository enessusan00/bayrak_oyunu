import 'dart:io';

import 'package:bayrak_oyunu/bayrak.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbErisim {
  static final String dbAdi = "bayrakquiz.sqlite";
  static Future<Database> dbErisim() async {
    String dbpath = join(await getDatabasesPath(), dbAdi);
    if (await databaseExists(dbpath)) {
      print("database mevcut");
    } else {
      ByteData data = await rootBundle.load("lib/database/$dbAdi");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(dbpath).writeAsBytes(bytes, flush: true);
      print("kopyalandı");
    }
    return openDatabase(dbpath);
  }
}


