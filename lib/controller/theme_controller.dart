import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  int _themeListIndex = 0;
  final List<ThemeMode> _themeList = [
    ThemeMode.system,
    ThemeMode.light,
    ThemeMode.dark,
  ];

  int get getThemeListIndex => _themeListIndex;

  ThemeMode get getThemeMode => _themeList[_themeListIndex];

  changeTheme() {
    (_themeListIndex == 1) ? _themeListIndex = 0 : _themeListIndex = 1;
    notifyListeners();
  }
}

class DarkModeIconController extends ChangeNotifier {
  //! fab Widget icon for dark/light mode
  int _iconListIndex = 1;

  final List<Icon> _iconList = [
    const Icon(Icons.nightlight_outlined),
    const Icon(Icons.wb_sunny_outlined),
  ];

  int get getIconListIndex => _iconListIndex;
  Icon get getIconThemeMode => _iconList[_iconListIndex];

  changeIcon() {
    (_iconListIndex == 1) ? _iconListIndex = 0 : _iconListIndex = 1;
  }
}
