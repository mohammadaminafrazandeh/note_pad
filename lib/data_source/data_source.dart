abstract class DataSource<T> {
  Future<List<T>> getAll({String Keyword = ''});
  Future<T> getById(String id);
  Future<int> createOrUpdate(T data);
  Future<void> delete(T data);
  Future<void> deleteByID(int id);
  Future<void> deleteAll();
  Map<int, int> yearMonthExist({String Keyword = ''});
  List<T> getByMonthDate(int month);
}
