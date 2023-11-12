import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:note_pad/model/note.dart';
import 'dart:collection';

class HiveService extends ChangeNotifier {
  List<Note> _notes = [];
  UnmodifiableListView<Note> get notes => UnmodifiableListView(_notes);
  final String noteHiveBox = 'note-box'; //name of the box 

  // Create new note
  Future<void> createItem(Note note) async {
    Box<Note> box = await Hive.openBox<Note>(noteHiveBox);
    await box.add(note);
    _notes.add(note);
    _notes = box.values.toList();
    notifyListeners();
  }

  // Get notes
  Future<void> getItems() async {
    Box<Note> box = await Hive.openBox<Note>(noteHiveBox);
    _notes = box.values.toList();
    notifyListeners();
  }

  // remove a note
  Future<void> removeItem(Note note) async {
    Box<Note> box = await Hive.openBox<Note>(noteHiveBox);
    await box.delete(note.key);
    _notes = box.values.toList();
    notifyListeners();
  }

  //  // another-way of add a note 
  // Future<void> addItem(Note note) async {
  //   Box box = Hive.box(noteHiveBox);
  //   box.put("title","Study Flutter");     
  //   notifyListeners();
  // }

//    // add a note with auto-increamenting keys
//   Future<void> addItemIncreamenting(Note note) async {
//     Box box = Hive.box(noteHiveBox);
//     box.add('Study Flutter'); //index 0
//     box.add('Buy a coffee');  //index 1
//     notifyListeners();
//   }


}
