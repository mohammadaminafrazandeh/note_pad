import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveService extends ChangeNotifier {

  //* Add data to a list
  add<T>({required String boxName, required T Object}) async {
    var box = await Hive.openBox<T>(boxName);
    await box.add(Object);
  }

  //* Read data ==> List [data,data,data,data]
  Future<List<T>> getNotes<T>({required String boxName}) async {
    var box = await Hive.openBox<T>(boxName);
    return box.values.toList();
  }

}
