import 'package:flutter/material.dart';

class IndexProvider extends ChangeNotifier {
  late int _index;
  int get index => _index;
  set index(int index) {
    _index = index;
    ChangeNotifier();
  }
}
