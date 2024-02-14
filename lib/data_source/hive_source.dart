import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_pad/data_source/data_source.dart';
import 'package:note_pad/data/model/note_model.dart';
import 'package:shamsi_date/shamsi_date.dart';

class HiveNotesSource implements DataSource<NoteModel> {
  final Box<NoteModel> box;

  HiveNotesSource(this.box);

  @override
  Future<int> createOrUpdate(NoteModel data) async {
    int id;
    if (data.isInBox) {
      data.save();
      id = data.id;
    } else {
      id = await box.add(data);
    }
    return id;
  }

  @override
  Future<void> delete(NoteModel data) async {
    await data.delete();
  }

  @override
  Future<void> deleteAll() async {
    await box.clear();
  }

  @override
  Future<void> deleteByID(int id) async {
    await box.delete(id);
  }

  @override
  Future<List<NoteModel>> getAll({String Keyword = ''}) async {
    return await box.values
        .where((NoteModel note) => note.title.contains(Keyword))
        .toList();
  }

  @override
  Future<NoteModel> getById(String id) async {
    return await box.values.firstWhere((NoteModel note) => note.id == id);
  }

  @override
  Future<List<NoteModel>> getByDateMonth(Jalali month) async {
    return box.values
        .where((NoteModel note) => note.createdAt.month == month)
        .toList();
  }
}
