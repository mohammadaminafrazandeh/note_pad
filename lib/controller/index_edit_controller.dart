// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class IndexController extends ChangeNotifier {
  late int _indexEdit;
  int get getindexEdit => _indexEdit;
  setIndex(int index) {
    _indexEdit = index;
  }
}
