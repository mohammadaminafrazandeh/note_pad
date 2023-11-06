import 'package:flutter/material.dart';
import 'package:note_pad/models/note_model.dart';

class NoteController extends ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get getNotes => _notes;

  addNote(Note note) {
    _notes.add(note);
    notifyListeners();
  }

  getIdObject(int index) {
    return getNotes[index].id;
  }

  removeNote(index) {
    _notes.removeWhere((Note note) => note.id == getIdObject(index));
    notifyListeners();
  }

  findId(index) {
    Note desiredNote =
        _notes.firstWhere((Note note) => note.id == getNotes[index].id);
    return desiredNote.id;
  }

  modifyNoteTitle(index, value) {
    getNotes[index].title = value;
    notifyListeners();
  }
  modifyNoteDescribtion(index, value) {
    getNotes[index].describtion = value;
    notifyListeners();
  }
}
