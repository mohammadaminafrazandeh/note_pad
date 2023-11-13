import 'package:flutter/material.dart';
import 'package:note_pad/controller/service/routes/routes.dart';
import 'package:note_pad/view/constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      locale: const Locale('fa', 'IR'),
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors().white,
        useMaterial3: true,
        fontFamily: 'Iransans',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors().jasmineColor),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            foregroundColor: AppColors().auroMetalSaurusColor,
            backgroundColor: AppColors().jasmineColor),
        appBarTheme: AppBarTheme(
            backgroundColor: AppColors().jasmineColor,
            foregroundColor: AppColors().auroMetalSaurusColor),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide(color: AppColors().auroMetalSaurusColor)),
        ),
        listTileTheme: ListTileThemeData(
            titleTextStyle: TextStyle(color: AppColors().jasmineColor),
            subtitleTextStyle:
                TextStyle(color: AppColors().auroMetalSaurusColor)),
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
        fontFamily: 'Iransans',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors().jasmineColor),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            foregroundColor: AppColors().auroMetalSaurusColor,
            backgroundColor: AppColors().jasmineColor),
        appBarTheme: AppBarTheme(
            backgroundColor: AppColors().jasmineColor,
            foregroundColor: AppColors().auroMetalSaurusColor),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide(color: AppColors().auroMetalSaurusColor)),
        ),
        listTileTheme: ListTileThemeData(
            titleTextStyle: TextStyle(color: AppColors().whiteSmokeColor),
            subtitleTextStyle:
                TextStyle(color: AppColors().auroMetalSaurusColor)),
      ),
      themeMode: ThemeMode.light,
    );
  }
}
