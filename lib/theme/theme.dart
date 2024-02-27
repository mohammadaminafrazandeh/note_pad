//*  THEMES
import 'package:flutter/material.dart';
import 'package:note_pad/constants/constants.dart';

ThemeData MyLightTheme() {
  return ThemeData(
    useMaterial3: true,
    fontFamily: 'Iransans',
    scaffoldBackgroundColor: backgorundColor,
    primaryColor: primaryColor,
    primaryColorDark: foregroundColor,
    primaryColorLight: subtitleColor,
    //* APPBAR
    appBarTheme: AppBarTheme(foregroundColor: foregroundColor),
    //* FAB
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: black, backgroundColor: primaryColor),
    //* INPUT
    inputDecorationTheme: InputDecorationTheme(border: InputBorder.none),
    //* LIST TILE
    listTileTheme: ListTileThemeData(
        titleTextStyle: TextStyle(color: primaryColor),
        subtitleTextStyle: TextStyle(color: foregroundColor)),
    //* TEXT
    textTheme: TextTheme(
      //* bodies
      bodyLarge: TextStyle(
          color: foregroundColor,
          fontFamily: 'Yekan',
          fontSize: 20,
          fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(
          color: foregroundColor,
          fontFamily: 'Yekan',
          fontSize: 17,
          fontWeight: FontWeight.normal),
      bodySmall: TextStyle(
          color: foregroundColor,
          fontFamily: 'Yekan',
          fontSize: 14,
          fontWeight: FontWeight.normal),
      //* titles
      titleLarge: TextStyle(
          color: black,
          fontFamily: 'Yekan',
          fontSize: 23,
          fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
          color: black,
          fontFamily: 'Yekan',
          fontSize: 20,
          fontWeight: FontWeight.bold),
      titleSmall: TextStyle(
          color: black,
          fontFamily: 'Yekan',
          fontSize: 17,
          fontWeight: FontWeight.bold),
    ),
    //* ICON
    iconTheme: IconThemeData(color: black),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStateProperty.all(black),
      ),
    ),
    //* ELEVATED BUTTON
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primaryColor),
        foregroundColor: MaterialStateProperty.all(black),
      ),
    ),
  );
}
