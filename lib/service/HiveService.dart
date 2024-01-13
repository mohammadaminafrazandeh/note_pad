import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:note_pad/model/note_model.dart';

class HiveService {
  //* open box function
  static Future<Box> openBox(String boxName) async {
    if (kDebugMode) {
      print('+++++open box $boxName');
    }
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box(boxName);
    } else {
      return Hive.openBox(boxName);
    }
  }

  static Future<void> create<T>(String boxName, T item) async {
    String key = 'Notes';
    final box = await openBox(boxName);
    box.put(key, item);
    await box.close();
  }

  //* adding item function
  static Future<void> add<T>(String boxName, T item) async {
    if (kDebugMode) {
      print('+++++adding item ${item.toString()} to box $boxName');
    }
    final box = await openBox(boxName);
    await box.add(item);
    await box.close();
  }

  //* get item function
  static Future<Map<String, dynamic>> getBox<T>(String boxName) async {
    if (kDebugMode) {
      print('+++++getting box $boxName');
    }
    final box = await openBox(boxName);
    return box.toMap() as Map<String, dynamic>;
  }

  //* get all function
  static Future<List> getAll(String boxName) async {
    if (kDebugMode) {
      print('+++++getting all items from box $boxName');
    }
    final box = await openBox(boxName);
    var data = await box.values.toList();
    return data;
  }
}
