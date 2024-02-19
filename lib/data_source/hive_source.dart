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
  Map<int, int> yearMonthExist({String Keyword = ''}) {
    List<NoteModel> records = [];
    records = box.values
        .where((NoteModel record) => record.title.contains(Keyword))
        .toList();
    List<Jalali> timeStamps = [];
    for (var record in records) {
      timeStamps.add(record.createdAt.toJalali());
    }
    Map<int, int> timeStampsYearMonth = {};
    for (var timeStamp in timeStamps) {
      timeStampsYearMonth.addAll({timeStamp.year: timeStamp.month});
    }
    return timeStampsYearMonth;
  }

  @override
  List<NoteModel> getByDateYearMonth(List<Map<int, int>> yearMonthTimeStamps) {
    List<NoteModel> notes = [];
    List<Map<int, int>> timeStamps = yearMonthTimeStamps;
    for (var timeStamp in timeStamps) {
      NoteModel note = box.values.firstWhere((NoteModel note) =>
          note.createdAt.toJalali().year == timeStamp.keys.first &&
          note.createdAt.toJalali().month == timeStamp.values.first);
      notes.add(note);
    }
    return notes;
  }
}
