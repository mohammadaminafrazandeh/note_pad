import 'package:flutter/material.dart';

class AddOrEdit extends ChangeNotifier {
  bool _isEditing = false;

  bool get isEditing => _isEditing;

   set isEditing(bool value) {
    _isEditing = value;
    notifyListeners();
  }
}
