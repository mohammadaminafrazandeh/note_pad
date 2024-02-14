// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:note_pad/data_source/data_source.dart';

class Repository<T> extends ChangeNotifier implements DataSource<T> {
  DataSource<T> localDataSource;
  Repository({
    required this.localDataSource,
  });
  @override
  Future<int> createOrUpdate(data) async {
    final result;
    result = await localDataSource.createOrUpdate(data);
    notifyListeners();
    return result;
  }

  @override
  Future<void> delete(data) async {
    await localDataSource.delete(data);
    notifyListeners();
  }

  @override
  Future<void> deleteAll() async {
    await localDataSource.deleteAll();
    notifyListeners();
  }

  @override
  Future<void> deleteByID(int id) async {
    await localDataSource.deleteByID(id);
    notifyListeners();
  }

  @override
  Future<T> getById(String id) {
    return localDataSource.getById(id);
  }

  @override
  Future<List<T>> getAll({String Keyword = ''}) {
    return localDataSource.getAll(Keyword: Keyword);
  }

  @override
  Future<List<T>> getByDateMonth(month) async {
    List<T> result = await localDataSource.getByDateMonth(month);
    notifyListeners();
    return result;
  }
}
