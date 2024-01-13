//* this file help to get the data from HiveService

import 'package:note_pad/service/HiveService.dart';
import '../constants/constants.dart';

class NoteRepo {
  List<dynamic> _noteList = [];
  //getter
  List<dynamic> get noteList => _noteList;

  Future<void> getNoteList() async {
    var box = await HiveService.openBox(noteBox);
    _noteList = box.values.toList();
    print('note list is ${_noteList.length}');
  }

  void clearNoteList() {
    _noteList = [];
  }
//-------------------------------------------------------------
}
