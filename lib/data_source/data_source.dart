import 'package:shamsi_date/shamsi_date.dart';

abstract class DataSource<T> {
  Future<List<T>> getAll({String Keyword = ''});
  Future<T> getById(String id);
  Future<int> createOrUpdate(T data);
  Future<void> delete(T data);
  Future<void> deleteByID(int id);
  Future<void> deleteAll();
  Future<List<Map<int, int>>> yearMonthExist({String Keyword = ''});
  Future<List<T>> getByDateYearMonth(
      Future<List<Map<int, int>>> yearMonthTimeStamps);
}
