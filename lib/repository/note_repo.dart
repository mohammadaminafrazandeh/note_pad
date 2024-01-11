//* this file help to get the data from HiveService 


import 'package:note_pad/constants/constants.dart';
import 'package:note_pad/model/note_model.dart';
import 'package:note_pad/service/HiveService.dart';

class NoteRepo {
  List<NoteModel> _noteList = [];
  //getter 
  List<NoteModel> get noteList => _noteList;

  Future<void> getNoteList() async {
    _noteList = await HiveService.getAll<NoteModel>(noteBox);
    print('note list is ${_noteList.length}');
  }
  void clearNoteList(){
    _noteList = [];
  }
//-------------------------------------------------------------

}