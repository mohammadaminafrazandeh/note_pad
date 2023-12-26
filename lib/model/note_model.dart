import 'package:isar/isar.dart';

//-----------------------
part 'note_model.g.dart';
//-----------------------

@collection
class NoteModel {
  Id id = Isar.autoIncrement; // id of the note
  String title; // title of the note
  String description; // description of the note
  String createdAt; // creation date of the note
  String? updatedAt; // update date of the note

  NoteModel({
    required this.updatedAt,
    required this.title,
    required this.description,
    required this.createdAt,
  });
}
