import 'package:flutter/material.dart';
import 'package:note_pad/routes/routes.dart';

import 'package:note_pad/constants/constants.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        locale: const Locale('fa', 'IR'),
        theme: MyLightTheme(),
        themeMode: ThemeMode.light,
      ),
    );
  }

  ThemeData MyLightTheme() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Iransans',
      scaffoldBackgroundColor: primaryColor,
      colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
      //* APPBAR
      appBarTheme: AppBarTheme(
          backgroundColor: primaryColor, foregroundColor: foregroundColor),
      //* FAB
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: foregroundColor, backgroundColor: primaryColor),
      //* INPUT
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide(color: foregroundColor)),
      ),
      //* LIST TILE
      listTileTheme: ListTileThemeData(
          titleTextStyle: TextStyle(color: primaryColor),
          subtitleTextStyle: TextStyle(color: foregroundColor)),
    );
  }
}
