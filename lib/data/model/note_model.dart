import 'package:hive/hive.dart';

//-----------------------
part 'note_model.g.dart';
//-----------------------

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  int id = -1;
  @HiveField(0)
  String title = 'عنوان ندارد'; // title of the note
  @HiveField(1)
  String description = 'توضیحات ندارد'; // description of the note
  @HiveField(2)
  DateTime createdAt = DateTime.now(); // creation date of the note
  @HiveField(3)
  DateTime? updatedAt; // update date of the note
}
