import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class HiveService {
  //* open box function
  static Future<Box<T>> openBox<T>(String boxName) async {
    if (kDebugMode) {
      print('+++++open box $boxName');
    }
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box<T>(boxName);
    } else {
      return Hive.openBox<T>(boxName);
    }
  }

  //* adding item function
  static Future<void> add<T>(String boxName, T item) async {
    if (kDebugMode) {
      print('+++++adding item ${item.toString()} to box $boxName');
    }
    final box = await openBox<T>(boxName);
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
  static Future<List<T>> getAll<T>(String boxName) async {
    if (kDebugMode) {
      print('+++++getting all items from box $boxName');
    }

    final box = await openBox<T>(boxName);
    return box.values.toList();
  }

  








}
