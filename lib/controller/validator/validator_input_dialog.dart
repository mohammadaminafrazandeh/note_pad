import 'package:flutter/material.dart';
import 'package:note_pad/models/validation_items.dart';

class InputValidation extends ChangeNotifier {
  ValitaionItem _errorAndValueItemsTitle = ValitaionItem(null, null);
  ValitaionItem _errorAndValueItemsSubtitle = ValitaionItem(null, null);
  //Getter
  ValitaionItem get getErrorAndValueItemsTitle => _errorAndValueItemsTitle;
  ValitaionItem get getErrorAndValueItemsSubtitle =>
      _errorAndValueItemsSubtitle;

  //Setter
  void validationTitle(String value) {
    if (value.isEmpty) {
      _errorAndValueItemsTitle =
          ValitaionItem(null, 'فیلد عنوان نباید خالی باشد');
    } else if (value.length >= 20) {
      _errorAndValueItemsTitle =
          ValitaionItem(null, 'فیلد بیش از 20 کارکتر نمی پذیرد');
    } else {
      _errorAndValueItemsTitle = ValitaionItem(value, null);
    }
    notifyListeners();
  }

  void resterTitle() {
    _errorAndValueItemsTitle = ValitaionItem(null, null);
    notifyListeners();
  }

  //
  void validationSubtitle(String value) {
    if (value.isEmpty) {
      _errorAndValueItemsSubtitle =
          ValitaionItem(null, 'فیلد توضیحات نباید خالی باشد');
    } else if (value.length >= 100) {
      _errorAndValueItemsSubtitle =
          ValitaionItem(null, 'فیلد بیش از 100 کارکتر نمی پذیرد');
    } else {
      _errorAndValueItemsSubtitle = ValitaionItem(value, null);
    }
    notifyListeners();
  }

  void resterSubtitle() {
    _errorAndValueItemsSubtitle = ValitaionItem(null, null);
    notifyListeners();
  }

  var _newValueOnSaveTitle;
  get getnewValueOnSaveTitle => _newValueOnSaveTitle;
  setValueOnSaveTitle(var newValue) {
    _newValueOnSaveTitle = newValue;
    
  }

  var _newValueOnSaveDescribtion;
  get getnewValueOnSaveDescribtion => _newValueOnSaveDescribtion;
  setValueOnSaveDescribtion(var newValue) {
    _newValueOnSaveDescribtion = newValue;
    
  }
}
