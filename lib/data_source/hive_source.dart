import 'dart:ffi';

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
    List<int> years = [];
    List<int> months = [];
    List<int> uniqueYear = [];
    List<int> uniqueMonth = [];
    for (var timeStamp in timeStamps) {
      years.add(timeStamp.year);
      months.add(timeStamp.month);
    }
    for (var year in years) {
      for (var i = 0; i < months.length; i++) {
        if (months[years.indexOf(year)] != months[i]) {
          uniqueMonth.add(months[i]);
          uniqueYear.add(year);
        } else if (months[years.indexOf(year)] == months[i]) {
          if (!uniqueMonth.contains(months[i])) {
            uniqueMonth.add(months[i]);
            uniqueYear.add(year);
          }
        }
      }
    }

    //
    Map<int, int> timeStampsYearMonth = {};
    for (var year in uniqueYear) {
      timeStampsYearMonth[year] = uniqueMonth[uniqueYear.indexOf(year)];
    }
    //
    return timeStampsYearMonth;
  }

  @override
  List<NoteModel> getByDateYearMonth(int year, int month) {
    List<NoteModel> notes = [];
    notes = box.values
        .where((NoteModel note) =>
            note.createdAt.toJalali().year == year &&
            note.createdAt.toJalali().month == month)
        .toList();
    return notes;
  }
}
