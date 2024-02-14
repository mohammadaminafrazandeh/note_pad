import 'package:hive/hive.dart';
import 'package:shamsi_date/shamsi_date.dart';

//-----------------------
part 'note_model.g.dart';
//-----------------------

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  int id = -1;
  @HiveField(0)
  String title; // title of the note
  @HiveField(1)
  String description; // description of the note
  @HiveField(2)
  Jalali createdAt; // creation date of the note
  @HiveField(3)
  Jalali? updatedAt; // update date of the note

  NoteModel({
    required this.title,
    required this.description,
    required this.createdAt,
    this.updatedAt,
  });
}
