import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:note_pad/model/note.dart';

class HiveService extends ChangeNotifier {
  List<Note> _notes = [];
  List<String> _titles = [];
  List<String> _describtions = [];
  // late String _desiredTitle;
  // late String _desiredDescribtion;
  // String get getDesiredTitle => _desiredTitle;
  // String get getDesireddescribtion => _desiredDescribtion;

  List<Note> get notes => _notes;
  final String noteHiveBox = 'note-box'; //name of the box
  //
  List<String> get titles => _titles;
  List<String> get describtions => _describtions;
  //
  set titles(List list) {
    titles = list;
    notifyListeners();
  }

  set describtions(List list) {
    describtions = list;
    notifyListeners();
  }

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

  Future<String> desierdTitle(index) async {
    Box<Note> box = await Hive.openBox<Note>(noteHiveBox);
    return box.getAt(index)!.title;
  }

  Future<String> desierdDecription(index) async {
    Box<Note> box = await Hive.openBox<Note>(noteHiveBox);
    return box.getAt(index)!.description;
  }

  // remove a note
  Future<void> removeItem(Note note) async {
    Box<Note> box = await Hive.openBox<Note>(noteHiveBox);
    await box.delete(note.key);
    _notes = box.values.toList();
    notifyListeners();
  }

  Future<void> deleteBox(index) async {
    Box<Note> box = await Hive.openBox<Note>(noteHiveBox);
    box.getAt(index)!.delete();
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
